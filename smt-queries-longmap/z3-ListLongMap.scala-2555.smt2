; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39134 () Bool)

(assert start!39134)

(declare-fun b_free!9415 () Bool)

(declare-fun b_next!9415 () Bool)

(assert (=> start!39134 (= b_free!9415 (not b_next!9415))))

(declare-fun tp!33774 () Bool)

(declare-fun b_and!16815 () Bool)

(assert (=> start!39134 (= tp!33774 b_and!16815)))

(declare-fun b!411893 () Bool)

(declare-fun res!239100 () Bool)

(declare-fun e!246577 () Bool)

(assert (=> b!411893 (=> (not res!239100) (not e!246577))))

(declare-datatypes ((array!24996 0))(
  ( (array!24997 (arr!11947 (Array (_ BitVec 32) (_ BitVec 64))) (size!12299 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24996)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411893 (= res!239100 (or (= (select (arr!11947 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11947 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!239093 () Bool)

(assert (=> start!39134 (=> (not res!239093) (not e!246577))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39134 (= res!239093 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12299 _keys!709))))))

(assert (=> start!39134 e!246577))

(declare-fun tp_is_empty!10567 () Bool)

(assert (=> start!39134 tp_is_empty!10567))

(assert (=> start!39134 tp!33774))

(assert (=> start!39134 true))

(declare-datatypes ((V!15195 0))(
  ( (V!15196 (val!5328 Int)) )
))
(declare-datatypes ((ValueCell!4940 0))(
  ( (ValueCellFull!4940 (v!7576 V!15195)) (EmptyCell!4940) )
))
(declare-datatypes ((array!24998 0))(
  ( (array!24999 (arr!11948 (Array (_ BitVec 32) ValueCell!4940)) (size!12300 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24998)

(declare-fun e!246579 () Bool)

(declare-fun array_inv!8792 (array!24998) Bool)

(assert (=> start!39134 (and (array_inv!8792 _values!549) e!246579)))

(declare-fun array_inv!8793 (array!24996) Bool)

(assert (=> start!39134 (array_inv!8793 _keys!709)))

(declare-fun mapNonEmpty!17472 () Bool)

(declare-fun mapRes!17472 () Bool)

(declare-fun tp!33773 () Bool)

(declare-fun e!246580 () Bool)

(assert (=> mapNonEmpty!17472 (= mapRes!17472 (and tp!33773 e!246580))))

(declare-fun mapValue!17472 () ValueCell!4940)

(declare-fun mapKey!17472 () (_ BitVec 32))

(declare-fun mapRest!17472 () (Array (_ BitVec 32) ValueCell!4940))

(assert (=> mapNonEmpty!17472 (= (arr!11948 _values!549) (store mapRest!17472 mapKey!17472 mapValue!17472))))

(declare-fun b!411894 () Bool)

(declare-fun e!246575 () Bool)

(assert (=> b!411894 (= e!246577 e!246575)))

(declare-fun res!239091 () Bool)

(assert (=> b!411894 (=> (not res!239091) (not e!246575))))

(declare-fun lt!189400 () array!24996)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24996 (_ BitVec 32)) Bool)

(assert (=> b!411894 (= res!239091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189400 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!411894 (= lt!189400 (array!24997 (store (arr!11947 _keys!709) i!563 k0!794) (size!12299 _keys!709)))))

(declare-fun b!411895 () Bool)

(declare-fun res!239094 () Bool)

(assert (=> b!411895 (=> (not res!239094) (not e!246577))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!411895 (= res!239094 (and (= (size!12300 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12299 _keys!709) (size!12300 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411896 () Bool)

(declare-fun res!239097 () Bool)

(assert (=> b!411896 (=> (not res!239097) (not e!246577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411896 (= res!239097 (validMask!0 mask!1025))))

(declare-fun b!411897 () Bool)

(declare-fun res!239098 () Bool)

(assert (=> b!411897 (=> (not res!239098) (not e!246575))))

(assert (=> b!411897 (= res!239098 (bvsle from!863 i!563))))

(declare-fun b!411898 () Bool)

(declare-fun res!239095 () Bool)

(assert (=> b!411898 (=> (not res!239095) (not e!246575))))

(declare-datatypes ((List!6804 0))(
  ( (Nil!6801) (Cons!6800 (h!7656 (_ BitVec 64)) (t!11970 List!6804)) )
))
(declare-fun arrayNoDuplicates!0 (array!24996 (_ BitVec 32) List!6804) Bool)

(assert (=> b!411898 (= res!239095 (arrayNoDuplicates!0 lt!189400 #b00000000000000000000000000000000 Nil!6801))))

(declare-fun b!411899 () Bool)

(declare-fun res!239096 () Bool)

(assert (=> b!411899 (=> (not res!239096) (not e!246577))))

(assert (=> b!411899 (= res!239096 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12299 _keys!709))))))

(declare-fun b!411900 () Bool)

(declare-fun res!239089 () Bool)

(assert (=> b!411900 (=> (not res!239089) (not e!246577))))

(declare-fun arrayContainsKey!0 (array!24996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411900 (= res!239089 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!411901 () Bool)

(declare-fun e!246576 () Bool)

(assert (=> b!411901 (= e!246576 tp_is_empty!10567)))

(declare-fun b!411902 () Bool)

(assert (=> b!411902 (= e!246575 false)))

(declare-fun minValue!515 () V!15195)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!15195)

(declare-datatypes ((tuple2!6784 0))(
  ( (tuple2!6785 (_1!3403 (_ BitVec 64)) (_2!3403 V!15195)) )
))
(declare-datatypes ((List!6805 0))(
  ( (Nil!6802) (Cons!6801 (h!7657 tuple2!6784) (t!11971 List!6805)) )
))
(declare-datatypes ((ListLongMap!5699 0))(
  ( (ListLongMap!5700 (toList!2865 List!6805)) )
))
(declare-fun lt!189402 () ListLongMap!5699)

(declare-fun zeroValue!515 () V!15195)

(declare-fun getCurrentListMapNoExtraKeys!1117 (array!24996 array!24998 (_ BitVec 32) (_ BitVec 32) V!15195 V!15195 (_ BitVec 32) Int) ListLongMap!5699)

(assert (=> b!411902 (= lt!189402 (getCurrentListMapNoExtraKeys!1117 lt!189400 (array!24999 (store (arr!11948 _values!549) i!563 (ValueCellFull!4940 v!412)) (size!12300 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189401 () ListLongMap!5699)

(assert (=> b!411902 (= lt!189401 (getCurrentListMapNoExtraKeys!1117 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17472 () Bool)

(assert (=> mapIsEmpty!17472 mapRes!17472))

(declare-fun b!411903 () Bool)

(declare-fun res!239090 () Bool)

(assert (=> b!411903 (=> (not res!239090) (not e!246577))))

(assert (=> b!411903 (= res!239090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411904 () Bool)

(declare-fun res!239092 () Bool)

(assert (=> b!411904 (=> (not res!239092) (not e!246577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411904 (= res!239092 (validKeyInArray!0 k0!794))))

(declare-fun b!411905 () Bool)

(assert (=> b!411905 (= e!246580 tp_is_empty!10567)))

(declare-fun b!411906 () Bool)

(declare-fun res!239099 () Bool)

(assert (=> b!411906 (=> (not res!239099) (not e!246577))))

(assert (=> b!411906 (= res!239099 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6801))))

(declare-fun b!411907 () Bool)

(assert (=> b!411907 (= e!246579 (and e!246576 mapRes!17472))))

(declare-fun condMapEmpty!17472 () Bool)

(declare-fun mapDefault!17472 () ValueCell!4940)

(assert (=> b!411907 (= condMapEmpty!17472 (= (arr!11948 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4940)) mapDefault!17472)))))

(assert (= (and start!39134 res!239093) b!411896))

(assert (= (and b!411896 res!239097) b!411895))

(assert (= (and b!411895 res!239094) b!411903))

(assert (= (and b!411903 res!239090) b!411906))

(assert (= (and b!411906 res!239099) b!411899))

(assert (= (and b!411899 res!239096) b!411904))

(assert (= (and b!411904 res!239092) b!411893))

(assert (= (and b!411893 res!239100) b!411900))

(assert (= (and b!411900 res!239089) b!411894))

(assert (= (and b!411894 res!239091) b!411898))

(assert (= (and b!411898 res!239095) b!411897))

(assert (= (and b!411897 res!239098) b!411902))

(assert (= (and b!411907 condMapEmpty!17472) mapIsEmpty!17472))

(assert (= (and b!411907 (not condMapEmpty!17472)) mapNonEmpty!17472))

(get-info :version)

(assert (= (and mapNonEmpty!17472 ((_ is ValueCellFull!4940) mapValue!17472)) b!411905))

(assert (= (and b!411907 ((_ is ValueCellFull!4940) mapDefault!17472)) b!411901))

(assert (= start!39134 b!411907))

(declare-fun m!402153 () Bool)

(assert (=> b!411900 m!402153))

(declare-fun m!402155 () Bool)

(assert (=> b!411898 m!402155))

(declare-fun m!402157 () Bool)

(assert (=> b!411902 m!402157))

(declare-fun m!402159 () Bool)

(assert (=> b!411902 m!402159))

(declare-fun m!402161 () Bool)

(assert (=> b!411902 m!402161))

(declare-fun m!402163 () Bool)

(assert (=> b!411896 m!402163))

(declare-fun m!402165 () Bool)

(assert (=> b!411904 m!402165))

(declare-fun m!402167 () Bool)

(assert (=> b!411894 m!402167))

(declare-fun m!402169 () Bool)

(assert (=> b!411894 m!402169))

(declare-fun m!402171 () Bool)

(assert (=> b!411906 m!402171))

(declare-fun m!402173 () Bool)

(assert (=> b!411893 m!402173))

(declare-fun m!402175 () Bool)

(assert (=> mapNonEmpty!17472 m!402175))

(declare-fun m!402177 () Bool)

(assert (=> start!39134 m!402177))

(declare-fun m!402179 () Bool)

(assert (=> start!39134 m!402179))

(declare-fun m!402181 () Bool)

(assert (=> b!411903 m!402181))

(check-sat (not b!411906) b_and!16815 (not mapNonEmpty!17472) tp_is_empty!10567 (not b!411903) (not b!411902) (not b_next!9415) (not b!411898) (not b!411894) (not b!411904) (not b!411900) (not b!411896) (not start!39134))
(check-sat b_and!16815 (not b_next!9415))
