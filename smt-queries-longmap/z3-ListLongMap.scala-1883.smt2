; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33718 () Bool)

(assert start!33718)

(declare-fun b_free!6967 () Bool)

(declare-fun b_next!6967 () Bool)

(assert (=> start!33718 (= b_free!6967 (not b_next!6967))))

(declare-fun tp!24404 () Bool)

(declare-fun b_and!14121 () Bool)

(assert (=> start!33718 (= tp!24404 b_and!14121)))

(declare-fun b!335185 () Bool)

(declare-fun res!184990 () Bool)

(declare-fun e!205742 () Bool)

(assert (=> b!335185 (=> (not res!184990) (not e!205742))))

(declare-datatypes ((array!17411 0))(
  ( (array!17412 (arr!8236 (Array (_ BitVec 32) (_ BitVec 64))) (size!8589 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17411)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17411 (_ BitVec 32)) Bool)

(assert (=> b!335185 (= res!184990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335186 () Bool)

(declare-fun res!184992 () Bool)

(assert (=> b!335186 (=> (not res!184992) (not e!205742))))

(declare-datatypes ((V!10203 0))(
  ( (V!10204 (val!3504 Int)) )
))
(declare-datatypes ((ValueCell!3116 0))(
  ( (ValueCellFull!3116 (v!5660 V!10203)) (EmptyCell!3116) )
))
(declare-datatypes ((array!17413 0))(
  ( (array!17414 (arr!8237 (Array (_ BitVec 32) ValueCell!3116)) (size!8590 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17413)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335186 (= res!184992 (and (= (size!8590 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8589 _keys!1895) (size!8590 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335187 () Bool)

(declare-fun res!184994 () Bool)

(assert (=> b!335187 (=> (not res!184994) (not e!205742))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335187 (= res!184994 (validKeyInArray!0 k0!1348))))

(declare-fun b!335188 () Bool)

(declare-fun e!205746 () Bool)

(declare-fun tp_is_empty!6919 () Bool)

(assert (=> b!335188 (= e!205746 tp_is_empty!6919)))

(declare-fun mapNonEmpty!11775 () Bool)

(declare-fun mapRes!11775 () Bool)

(declare-fun tp!24405 () Bool)

(assert (=> mapNonEmpty!11775 (= mapRes!11775 (and tp!24405 e!205746))))

(declare-fun mapKey!11775 () (_ BitVec 32))

(declare-fun mapValue!11775 () ValueCell!3116)

(declare-fun mapRest!11775 () (Array (_ BitVec 32) ValueCell!3116))

(assert (=> mapNonEmpty!11775 (= (arr!8237 _values!1525) (store mapRest!11775 mapKey!11775 mapValue!11775))))

(declare-fun b!335189 () Bool)

(declare-fun e!205747 () Bool)

(declare-fun e!205745 () Bool)

(assert (=> b!335189 (= e!205747 e!205745)))

(declare-fun res!184988 () Bool)

(assert (=> b!335189 (=> (not res!184988) (not e!205745))))

(declare-datatypes ((SeekEntryResult!3188 0))(
  ( (MissingZero!3188 (index!14931 (_ BitVec 32))) (Found!3188 (index!14932 (_ BitVec 32))) (Intermediate!3188 (undefined!4000 Bool) (index!14933 (_ BitVec 32)) (x!33429 (_ BitVec 32))) (Undefined!3188) (MissingVacant!3188 (index!14934 (_ BitVec 32))) )
))
(declare-fun lt!159604 () SeekEntryResult!3188)

(get-info :version)

(assert (=> b!335189 (= res!184988 (and ((_ is Found!3188) lt!159604) (= (select (arr!8236 _keys!1895) (index!14932 lt!159604)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17411 (_ BitVec 32)) SeekEntryResult!3188)

(assert (=> b!335189 (= lt!159604 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335190 () Bool)

(assert (=> b!335190 (= e!205745 (not true))))

(declare-datatypes ((tuple2!5038 0))(
  ( (tuple2!5039 (_1!2530 (_ BitVec 64)) (_2!2530 V!10203)) )
))
(declare-datatypes ((List!4675 0))(
  ( (Nil!4672) (Cons!4671 (h!5527 tuple2!5038) (t!9754 List!4675)) )
))
(declare-datatypes ((ListLongMap!3941 0))(
  ( (ListLongMap!3942 (toList!1986 List!4675)) )
))
(declare-fun lt!159605 () ListLongMap!3941)

(declare-fun contains!2041 (ListLongMap!3941 (_ BitVec 64)) Bool)

(assert (=> b!335190 (contains!2041 lt!159605 (select (arr!8236 _keys!1895) (index!14932 lt!159604)))))

(declare-fun zeroValue!1467 () V!10203)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10203)

(declare-datatypes ((Unit!10422 0))(
  ( (Unit!10423) )
))
(declare-fun lt!159603 () Unit!10422)

(declare-fun lemmaValidKeyInArrayIsInListMap!168 (array!17411 array!17413 (_ BitVec 32) (_ BitVec 32) V!10203 V!10203 (_ BitVec 32) Int) Unit!10422)

(assert (=> b!335190 (= lt!159603 (lemmaValidKeyInArrayIsInListMap!168 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14932 lt!159604) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335190 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159606 () Unit!10422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17411 (_ BitVec 64) (_ BitVec 32)) Unit!10422)

(assert (=> b!335190 (= lt!159606 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14932 lt!159604)))))

(declare-fun b!335191 () Bool)

(assert (=> b!335191 (= e!205742 e!205747)))

(declare-fun res!184993 () Bool)

(assert (=> b!335191 (=> (not res!184993) (not e!205747))))

(assert (=> b!335191 (= res!184993 (not (contains!2041 lt!159605 k0!1348)))))

(declare-fun getCurrentListMap!1493 (array!17411 array!17413 (_ BitVec 32) (_ BitVec 32) V!10203 V!10203 (_ BitVec 32) Int) ListLongMap!3941)

(assert (=> b!335191 (= lt!159605 (getCurrentListMap!1493 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun mapIsEmpty!11775 () Bool)

(assert (=> mapIsEmpty!11775 mapRes!11775))

(declare-fun b!335193 () Bool)

(declare-fun e!205741 () Bool)

(assert (=> b!335193 (= e!205741 tp_is_empty!6919)))

(declare-fun b!335194 () Bool)

(declare-fun e!205744 () Bool)

(assert (=> b!335194 (= e!205744 (and e!205741 mapRes!11775))))

(declare-fun condMapEmpty!11775 () Bool)

(declare-fun mapDefault!11775 () ValueCell!3116)

(assert (=> b!335194 (= condMapEmpty!11775 (= (arr!8237 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3116)) mapDefault!11775)))))

(declare-fun b!335195 () Bool)

(declare-fun res!184991 () Bool)

(assert (=> b!335195 (=> (not res!184991) (not e!205745))))

(assert (=> b!335195 (= res!184991 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14932 lt!159604)))))

(declare-fun res!184987 () Bool)

(assert (=> start!33718 (=> (not res!184987) (not e!205742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33718 (= res!184987 (validMask!0 mask!2385))))

(assert (=> start!33718 e!205742))

(assert (=> start!33718 true))

(assert (=> start!33718 tp_is_empty!6919))

(assert (=> start!33718 tp!24404))

(declare-fun array_inv!6146 (array!17413) Bool)

(assert (=> start!33718 (and (array_inv!6146 _values!1525) e!205744)))

(declare-fun array_inv!6147 (array!17411) Bool)

(assert (=> start!33718 (array_inv!6147 _keys!1895)))

(declare-fun b!335192 () Bool)

(declare-fun res!184989 () Bool)

(assert (=> b!335192 (=> (not res!184989) (not e!205742))))

(declare-datatypes ((List!4676 0))(
  ( (Nil!4673) (Cons!4672 (h!5528 (_ BitVec 64)) (t!9755 List!4676)) )
))
(declare-fun arrayNoDuplicates!0 (array!17411 (_ BitVec 32) List!4676) Bool)

(assert (=> b!335192 (= res!184989 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4673))))

(assert (= (and start!33718 res!184987) b!335186))

(assert (= (and b!335186 res!184992) b!335185))

(assert (= (and b!335185 res!184990) b!335192))

(assert (= (and b!335192 res!184989) b!335187))

(assert (= (and b!335187 res!184994) b!335191))

(assert (= (and b!335191 res!184993) b!335189))

(assert (= (and b!335189 res!184988) b!335195))

(assert (= (and b!335195 res!184991) b!335190))

(assert (= (and b!335194 condMapEmpty!11775) mapIsEmpty!11775))

(assert (= (and b!335194 (not condMapEmpty!11775)) mapNonEmpty!11775))

(assert (= (and mapNonEmpty!11775 ((_ is ValueCellFull!3116) mapValue!11775)) b!335188))

(assert (= (and b!335194 ((_ is ValueCellFull!3116) mapDefault!11775)) b!335193))

(assert (= start!33718 b!335194))

(declare-fun m!338723 () Bool)

(assert (=> b!335190 m!338723))

(declare-fun m!338725 () Bool)

(assert (=> b!335190 m!338725))

(declare-fun m!338727 () Bool)

(assert (=> b!335190 m!338727))

(declare-fun m!338729 () Bool)

(assert (=> b!335190 m!338729))

(declare-fun m!338731 () Bool)

(assert (=> b!335190 m!338731))

(assert (=> b!335190 m!338729))

(declare-fun m!338733 () Bool)

(assert (=> mapNonEmpty!11775 m!338733))

(assert (=> b!335189 m!338729))

(declare-fun m!338735 () Bool)

(assert (=> b!335189 m!338735))

(declare-fun m!338737 () Bool)

(assert (=> b!335192 m!338737))

(declare-fun m!338739 () Bool)

(assert (=> b!335191 m!338739))

(declare-fun m!338741 () Bool)

(assert (=> b!335191 m!338741))

(declare-fun m!338743 () Bool)

(assert (=> b!335195 m!338743))

(declare-fun m!338745 () Bool)

(assert (=> b!335185 m!338745))

(declare-fun m!338747 () Bool)

(assert (=> start!33718 m!338747))

(declare-fun m!338749 () Bool)

(assert (=> start!33718 m!338749))

(declare-fun m!338751 () Bool)

(assert (=> start!33718 m!338751))

(declare-fun m!338753 () Bool)

(assert (=> b!335187 m!338753))

(check-sat (not b_next!6967) b_and!14121 (not b!335190) (not b!335192) (not b!335187) (not b!335189) tp_is_empty!6919 (not b!335195) (not mapNonEmpty!11775) (not b!335185) (not start!33718) (not b!335191))
(check-sat b_and!14121 (not b_next!6967))
