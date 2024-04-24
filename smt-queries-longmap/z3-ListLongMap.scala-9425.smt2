; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112382 () Bool)

(assert start!112382)

(declare-fun b_free!30553 () Bool)

(declare-fun b_next!30553 () Bool)

(assert (=> start!112382 (= b_free!30553 (not b_next!30553))))

(declare-fun tp!107295 () Bool)

(declare-fun b_and!49205 () Bool)

(assert (=> start!112382 (= tp!107295 b_and!49205)))

(declare-fun b!1329627 () Bool)

(declare-fun e!758194 () Bool)

(declare-fun tp_is_empty!36463 () Bool)

(assert (=> b!1329627 (= e!758194 tp_is_empty!36463)))

(declare-fun b!1329628 () Bool)

(declare-fun res!881861 () Bool)

(declare-fun e!758192 () Bool)

(assert (=> b!1329628 (=> (not res!881861) (not e!758192))))

(declare-datatypes ((array!89929 0))(
  ( (array!89930 (arr!43426 (Array (_ BitVec 32) (_ BitVec 64))) (size!43977 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89929)

(declare-datatypes ((List!30764 0))(
  ( (Nil!30761) (Cons!30760 (h!31978 (_ BitVec 64)) (t!44762 List!30764)) )
))
(declare-fun arrayNoDuplicates!0 (array!89929 (_ BitVec 32) List!30764) Bool)

(assert (=> b!1329628 (= res!881861 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30761))))

(declare-fun b!1329629 () Bool)

(declare-fun e!758191 () Bool)

(assert (=> b!1329629 (= e!758191 tp_is_empty!36463)))

(declare-fun b!1329630 () Bool)

(assert (=> b!1329630 (= e!758192 false)))

(declare-datatypes ((V!53721 0))(
  ( (V!53722 (val!18306 Int)) )
))
(declare-datatypes ((ValueCell!17333 0))(
  ( (ValueCellFull!17333 (v!20938 V!53721)) (EmptyCell!17333) )
))
(declare-datatypes ((array!89931 0))(
  ( (array!89932 (arr!43427 (Array (_ BitVec 32) ValueCell!17333)) (size!43978 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89931)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53721)

(declare-fun zeroValue!1262 () V!53721)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591303 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23588 0))(
  ( (tuple2!23589 (_1!11805 (_ BitVec 64)) (_2!11805 V!53721)) )
))
(declare-datatypes ((List!30765 0))(
  ( (Nil!30762) (Cons!30761 (h!31979 tuple2!23588) (t!44763 List!30765)) )
))
(declare-datatypes ((ListLongMap!21253 0))(
  ( (ListLongMap!21254 (toList!10642 List!30765)) )
))
(declare-fun contains!8818 (ListLongMap!21253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5619 (array!89929 array!89931 (_ BitVec 32) (_ BitVec 32) V!53721 V!53721 (_ BitVec 32) Int) ListLongMap!21253)

(assert (=> b!1329630 (= lt!591303 (contains!8818 (getCurrentListMap!5619 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56368 () Bool)

(declare-fun mapRes!56368 () Bool)

(declare-fun tp!107296 () Bool)

(assert (=> mapNonEmpty!56368 (= mapRes!56368 (and tp!107296 e!758194))))

(declare-fun mapRest!56368 () (Array (_ BitVec 32) ValueCell!17333))

(declare-fun mapKey!56368 () (_ BitVec 32))

(declare-fun mapValue!56368 () ValueCell!17333)

(assert (=> mapNonEmpty!56368 (= (arr!43427 _values!1320) (store mapRest!56368 mapKey!56368 mapValue!56368))))

(declare-fun b!1329631 () Bool)

(declare-fun e!758193 () Bool)

(assert (=> b!1329631 (= e!758193 (and e!758191 mapRes!56368))))

(declare-fun condMapEmpty!56368 () Bool)

(declare-fun mapDefault!56368 () ValueCell!17333)

(assert (=> b!1329631 (= condMapEmpty!56368 (= (arr!43427 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17333)) mapDefault!56368)))))

(declare-fun b!1329632 () Bool)

(declare-fun res!881859 () Bool)

(assert (=> b!1329632 (=> (not res!881859) (not e!758192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89929 (_ BitVec 32)) Bool)

(assert (=> b!1329632 (= res!881859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329633 () Bool)

(declare-fun res!881858 () Bool)

(assert (=> b!1329633 (=> (not res!881858) (not e!758192))))

(assert (=> b!1329633 (= res!881858 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43977 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329634 () Bool)

(declare-fun res!881857 () Bool)

(assert (=> b!1329634 (=> (not res!881857) (not e!758192))))

(assert (=> b!1329634 (= res!881857 (and (= (size!43978 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43977 _keys!1590) (size!43978 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!881860 () Bool)

(assert (=> start!112382 (=> (not res!881860) (not e!758192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112382 (= res!881860 (validMask!0 mask!1998))))

(assert (=> start!112382 e!758192))

(declare-fun array_inv!33047 (array!89931) Bool)

(assert (=> start!112382 (and (array_inv!33047 _values!1320) e!758193)))

(assert (=> start!112382 true))

(declare-fun array_inv!33048 (array!89929) Bool)

(assert (=> start!112382 (array_inv!33048 _keys!1590)))

(assert (=> start!112382 tp!107295))

(assert (=> start!112382 tp_is_empty!36463))

(declare-fun mapIsEmpty!56368 () Bool)

(assert (=> mapIsEmpty!56368 mapRes!56368))

(assert (= (and start!112382 res!881860) b!1329634))

(assert (= (and b!1329634 res!881857) b!1329632))

(assert (= (and b!1329632 res!881859) b!1329628))

(assert (= (and b!1329628 res!881861) b!1329633))

(assert (= (and b!1329633 res!881858) b!1329630))

(assert (= (and b!1329631 condMapEmpty!56368) mapIsEmpty!56368))

(assert (= (and b!1329631 (not condMapEmpty!56368)) mapNonEmpty!56368))

(get-info :version)

(assert (= (and mapNonEmpty!56368 ((_ is ValueCellFull!17333) mapValue!56368)) b!1329627))

(assert (= (and b!1329631 ((_ is ValueCellFull!17333) mapDefault!56368)) b!1329629))

(assert (= start!112382 b!1329631))

(declare-fun m!1218935 () Bool)

(assert (=> b!1329630 m!1218935))

(assert (=> b!1329630 m!1218935))

(declare-fun m!1218937 () Bool)

(assert (=> b!1329630 m!1218937))

(declare-fun m!1218939 () Bool)

(assert (=> start!112382 m!1218939))

(declare-fun m!1218941 () Bool)

(assert (=> start!112382 m!1218941))

(declare-fun m!1218943 () Bool)

(assert (=> start!112382 m!1218943))

(declare-fun m!1218945 () Bool)

(assert (=> b!1329628 m!1218945))

(declare-fun m!1218947 () Bool)

(assert (=> mapNonEmpty!56368 m!1218947))

(declare-fun m!1218949 () Bool)

(assert (=> b!1329632 m!1218949))

(check-sat (not b!1329628) tp_is_empty!36463 b_and!49205 (not b!1329630) (not b_next!30553) (not mapNonEmpty!56368) (not b!1329632) (not start!112382))
(check-sat b_and!49205 (not b_next!30553))
