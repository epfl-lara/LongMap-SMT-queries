; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38216 () Bool)

(assert start!38216)

(declare-fun b_free!9067 () Bool)

(declare-fun b_next!9067 () Bool)

(assert (=> start!38216 (= b_free!9067 (not b_next!9067))))

(declare-fun tp!31989 () Bool)

(declare-fun b_and!16427 () Bool)

(assert (=> start!38216 (= tp!31989 b_and!16427)))

(declare-fun b!394094 () Bool)

(declare-fun e!238555 () Bool)

(declare-fun e!238549 () Bool)

(assert (=> b!394094 (= e!238555 e!238549)))

(declare-fun res!225894 () Bool)

(assert (=> b!394094 (=> res!225894 e!238549)))

(declare-datatypes ((V!14091 0))(
  ( (V!14092 (val!4914 Int)) )
))
(declare-datatypes ((tuple2!6604 0))(
  ( (tuple2!6605 (_1!3313 (_ BitVec 64)) (_2!3313 V!14091)) )
))
(declare-datatypes ((List!6445 0))(
  ( (Nil!6442) (Cons!6441 (h!7297 tuple2!6604) (t!11610 List!6445)) )
))
(declare-datatypes ((ListLongMap!5507 0))(
  ( (ListLongMap!5508 (toList!2769 List!6445)) )
))
(declare-fun lt!186629 () ListLongMap!5507)

(declare-fun lt!186628 () tuple2!6604)

(declare-fun lt!186627 () ListLongMap!5507)

(declare-fun +!1089 (ListLongMap!5507 tuple2!6604) ListLongMap!5507)

(assert (=> b!394094 (= res!225894 (not (= (+!1089 lt!186627 lt!186628) lt!186629)))))

(declare-fun lt!186625 () ListLongMap!5507)

(assert (=> b!394094 (= lt!186629 lt!186625)))

(declare-fun b!394095 () Bool)

(declare-fun res!225888 () Bool)

(declare-fun e!238554 () Bool)

(assert (=> b!394095 (=> (not res!225888) (not e!238554))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4526 0))(
  ( (ValueCellFull!4526 (v!7153 V!14091)) (EmptyCell!4526) )
))
(declare-datatypes ((array!23371 0))(
  ( (array!23372 (arr!11142 (Array (_ BitVec 32) ValueCell!4526)) (size!11495 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23371)

(declare-datatypes ((array!23373 0))(
  ( (array!23374 (arr!11143 (Array (_ BitVec 32) (_ BitVec 64))) (size!11496 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23373)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!394095 (= res!225888 (and (= (size!11495 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11496 _keys!658) (size!11495 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394096 () Bool)

(declare-fun res!225891 () Bool)

(assert (=> b!394096 (=> (not res!225891) (not e!238554))))

(declare-datatypes ((List!6446 0))(
  ( (Nil!6443) (Cons!6442 (h!7298 (_ BitVec 64)) (t!11611 List!6446)) )
))
(declare-fun arrayNoDuplicates!0 (array!23373 (_ BitVec 32) List!6446) Bool)

(assert (=> b!394096 (= res!225891 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6443))))

(declare-fun b!394097 () Bool)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!394097 (= e!238549 (bvslt i!548 (size!11495 _values!506)))))

(declare-fun b!394098 () Bool)

(declare-fun e!238551 () Bool)

(assert (=> b!394098 (= e!238554 e!238551)))

(declare-fun res!225893 () Bool)

(assert (=> b!394098 (=> (not res!225893) (not e!238551))))

(declare-fun lt!186633 () array!23373)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23373 (_ BitVec 32)) Bool)

(assert (=> b!394098 (= res!225893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186633 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!394098 (= lt!186633 (array!23374 (store (arr!11143 _keys!658) i!548 k0!778) (size!11496 _keys!658)))))

(declare-fun b!394099 () Bool)

(declare-fun res!225897 () Bool)

(assert (=> b!394099 (=> (not res!225897) (not e!238554))))

(declare-fun arrayContainsKey!0 (array!23373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394099 (= res!225897 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!394100 () Bool)

(declare-fun res!225899 () Bool)

(assert (=> b!394100 (=> (not res!225899) (not e!238554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394100 (= res!225899 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16209 () Bool)

(declare-fun mapRes!16209 () Bool)

(declare-fun tp!31988 () Bool)

(declare-fun e!238556 () Bool)

(assert (=> mapNonEmpty!16209 (= mapRes!16209 (and tp!31988 e!238556))))

(declare-fun mapKey!16209 () (_ BitVec 32))

(declare-fun mapValue!16209 () ValueCell!4526)

(declare-fun mapRest!16209 () (Array (_ BitVec 32) ValueCell!4526))

(assert (=> mapNonEmpty!16209 (= (arr!11142 _values!506) (store mapRest!16209 mapKey!16209 mapValue!16209))))

(declare-fun b!394101 () Bool)

(declare-fun e!238550 () Bool)

(declare-fun e!238553 () Bool)

(assert (=> b!394101 (= e!238550 (and e!238553 mapRes!16209))))

(declare-fun condMapEmpty!16209 () Bool)

(declare-fun mapDefault!16209 () ValueCell!4526)

(assert (=> b!394101 (= condMapEmpty!16209 (= (arr!11142 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4526)) mapDefault!16209)))))

(declare-fun b!394102 () Bool)

(declare-fun res!225896 () Bool)

(assert (=> b!394102 (=> (not res!225896) (not e!238554))))

(assert (=> b!394102 (= res!225896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!225890 () Bool)

(assert (=> start!38216 (=> (not res!225890) (not e!238554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38216 (= res!225890 (validMask!0 mask!970))))

(assert (=> start!38216 e!238554))

(declare-fun array_inv!8180 (array!23371) Bool)

(assert (=> start!38216 (and (array_inv!8180 _values!506) e!238550)))

(assert (=> start!38216 tp!31989))

(assert (=> start!38216 true))

(declare-fun tp_is_empty!9739 () Bool)

(assert (=> start!38216 tp_is_empty!9739))

(declare-fun array_inv!8181 (array!23373) Bool)

(assert (=> start!38216 (array_inv!8181 _keys!658)))

(declare-fun b!394103 () Bool)

(assert (=> b!394103 (= e!238551 (not e!238555))))

(declare-fun res!225889 () Bool)

(assert (=> b!394103 (=> res!225889 e!238555)))

(declare-fun lt!186632 () Bool)

(assert (=> b!394103 (= res!225889 (or (and (not lt!186632) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186632) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186632)))))

(assert (=> b!394103 (= lt!186632 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14091)

(declare-fun minValue!472 () V!14091)

(declare-fun getCurrentListMap!2082 (array!23373 array!23371 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) Int) ListLongMap!5507)

(assert (=> b!394103 (= lt!186627 (getCurrentListMap!2082 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186626 () array!23371)

(assert (=> b!394103 (= lt!186629 (getCurrentListMap!2082 lt!186633 lt!186626 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186630 () ListLongMap!5507)

(assert (=> b!394103 (and (= lt!186625 lt!186630) (= lt!186630 lt!186625))))

(declare-fun lt!186624 () ListLongMap!5507)

(assert (=> b!394103 (= lt!186630 (+!1089 lt!186624 lt!186628))))

(declare-fun v!373 () V!14091)

(assert (=> b!394103 (= lt!186628 (tuple2!6605 k0!778 v!373))))

(declare-datatypes ((Unit!12026 0))(
  ( (Unit!12027) )
))
(declare-fun lt!186631 () Unit!12026)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 (array!23373 array!23371 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) (_ BitVec 64) V!14091 (_ BitVec 32) Int) Unit!12026)

(assert (=> b!394103 (= lt!186631 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!283 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!992 (array!23373 array!23371 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) Int) ListLongMap!5507)

(assert (=> b!394103 (= lt!186625 (getCurrentListMapNoExtraKeys!992 lt!186633 lt!186626 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394103 (= lt!186626 (array!23372 (store (arr!11142 _values!506) i!548 (ValueCellFull!4526 v!373)) (size!11495 _values!506)))))

(assert (=> b!394103 (= lt!186624 (getCurrentListMapNoExtraKeys!992 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394104 () Bool)

(declare-fun res!225895 () Bool)

(assert (=> b!394104 (=> (not res!225895) (not e!238554))))

(assert (=> b!394104 (= res!225895 (or (= (select (arr!11143 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11143 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394105 () Bool)

(assert (=> b!394105 (= e!238553 tp_is_empty!9739)))

(declare-fun b!394106 () Bool)

(declare-fun res!225892 () Bool)

(assert (=> b!394106 (=> (not res!225892) (not e!238551))))

(assert (=> b!394106 (= res!225892 (arrayNoDuplicates!0 lt!186633 #b00000000000000000000000000000000 Nil!6443))))

(declare-fun b!394107 () Bool)

(assert (=> b!394107 (= e!238556 tp_is_empty!9739)))

(declare-fun mapIsEmpty!16209 () Bool)

(assert (=> mapIsEmpty!16209 mapRes!16209))

(declare-fun b!394108 () Bool)

(declare-fun res!225898 () Bool)

(assert (=> b!394108 (=> (not res!225898) (not e!238554))))

(assert (=> b!394108 (= res!225898 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11496 _keys!658))))))

(assert (= (and start!38216 res!225890) b!394095))

(assert (= (and b!394095 res!225888) b!394102))

(assert (= (and b!394102 res!225896) b!394096))

(assert (= (and b!394096 res!225891) b!394108))

(assert (= (and b!394108 res!225898) b!394100))

(assert (= (and b!394100 res!225899) b!394104))

(assert (= (and b!394104 res!225895) b!394099))

(assert (= (and b!394099 res!225897) b!394098))

(assert (= (and b!394098 res!225893) b!394106))

(assert (= (and b!394106 res!225892) b!394103))

(assert (= (and b!394103 (not res!225889)) b!394094))

(assert (= (and b!394094 (not res!225894)) b!394097))

(assert (= (and b!394101 condMapEmpty!16209) mapIsEmpty!16209))

(assert (= (and b!394101 (not condMapEmpty!16209)) mapNonEmpty!16209))

(get-info :version)

(assert (= (and mapNonEmpty!16209 ((_ is ValueCellFull!4526) mapValue!16209)) b!394107))

(assert (= (and b!394101 ((_ is ValueCellFull!4526) mapDefault!16209)) b!394105))

(assert (= start!38216 b!394101))

(declare-fun m!390075 () Bool)

(assert (=> b!394096 m!390075))

(declare-fun m!390077 () Bool)

(assert (=> start!38216 m!390077))

(declare-fun m!390079 () Bool)

(assert (=> start!38216 m!390079))

(declare-fun m!390081 () Bool)

(assert (=> start!38216 m!390081))

(declare-fun m!390083 () Bool)

(assert (=> b!394106 m!390083))

(declare-fun m!390085 () Bool)

(assert (=> b!394098 m!390085))

(declare-fun m!390087 () Bool)

(assert (=> b!394098 m!390087))

(declare-fun m!390089 () Bool)

(assert (=> b!394104 m!390089))

(declare-fun m!390091 () Bool)

(assert (=> mapNonEmpty!16209 m!390091))

(declare-fun m!390093 () Bool)

(assert (=> b!394102 m!390093))

(declare-fun m!390095 () Bool)

(assert (=> b!394103 m!390095))

(declare-fun m!390097 () Bool)

(assert (=> b!394103 m!390097))

(declare-fun m!390099 () Bool)

(assert (=> b!394103 m!390099))

(declare-fun m!390101 () Bool)

(assert (=> b!394103 m!390101))

(declare-fun m!390103 () Bool)

(assert (=> b!394103 m!390103))

(declare-fun m!390105 () Bool)

(assert (=> b!394103 m!390105))

(declare-fun m!390107 () Bool)

(assert (=> b!394103 m!390107))

(declare-fun m!390109 () Bool)

(assert (=> b!394099 m!390109))

(declare-fun m!390111 () Bool)

(assert (=> b!394094 m!390111))

(declare-fun m!390113 () Bool)

(assert (=> b!394100 m!390113))

(check-sat (not mapNonEmpty!16209) (not b!394106) (not b!394099) (not b!394100) (not b!394096) tp_is_empty!9739 (not b!394098) (not b!394094) (not b!394103) (not b!394102) (not b_next!9067) b_and!16427 (not start!38216))
(check-sat b_and!16427 (not b_next!9067))
