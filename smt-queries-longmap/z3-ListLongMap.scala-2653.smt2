; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39738 () Bool)

(assert start!39738)

(declare-fun b_free!10005 () Bool)

(declare-fun b_next!10005 () Bool)

(assert (=> start!39738 (= b_free!10005 (not b_next!10005))))

(declare-fun tp!35543 () Bool)

(declare-fun b_and!17669 () Bool)

(assert (=> start!39738 (= tp!35543 b_and!17669)))

(declare-fun b!427566 () Bool)

(declare-fun res!250818 () Bool)

(declare-fun e!253505 () Bool)

(assert (=> b!427566 (=> (not res!250818) (not e!253505))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427566 (= res!250818 (validKeyInArray!0 k0!794))))

(declare-fun b!427567 () Bool)

(declare-fun res!250820 () Bool)

(assert (=> b!427567 (=> (not res!250820) (not e!253505))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26151 0))(
  ( (array!26152 (arr!12525 (Array (_ BitVec 32) (_ BitVec 64))) (size!12877 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26151)

(assert (=> b!427567 (= res!250820 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12877 _keys!709))))))

(declare-fun res!250815 () Bool)

(assert (=> start!39738 (=> (not res!250815) (not e!253505))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39738 (= res!250815 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12877 _keys!709))))))

(assert (=> start!39738 e!253505))

(declare-fun tp_is_empty!11157 () Bool)

(assert (=> start!39738 tp_is_empty!11157))

(assert (=> start!39738 tp!35543))

(assert (=> start!39738 true))

(declare-datatypes ((V!15981 0))(
  ( (V!15982 (val!5623 Int)) )
))
(declare-datatypes ((ValueCell!5235 0))(
  ( (ValueCellFull!5235 (v!7870 V!15981)) (EmptyCell!5235) )
))
(declare-datatypes ((array!26153 0))(
  ( (array!26154 (arr!12526 (Array (_ BitVec 32) ValueCell!5235)) (size!12878 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26153)

(declare-fun e!253508 () Bool)

(declare-fun array_inv!9128 (array!26153) Bool)

(assert (=> start!39738 (and (array_inv!9128 _values!549) e!253508)))

(declare-fun array_inv!9129 (array!26151) Bool)

(assert (=> start!39738 (array_inv!9129 _keys!709)))

(declare-fun b!427568 () Bool)

(declare-fun e!253509 () Bool)

(assert (=> b!427568 (= e!253505 e!253509)))

(declare-fun res!250811 () Bool)

(assert (=> b!427568 (=> (not res!250811) (not e!253509))))

(declare-fun lt!195352 () array!26151)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26151 (_ BitVec 32)) Bool)

(assert (=> b!427568 (= res!250811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195352 mask!1025))))

(assert (=> b!427568 (= lt!195352 (array!26152 (store (arr!12525 _keys!709) i!563 k0!794) (size!12877 _keys!709)))))

(declare-fun b!427569 () Bool)

(declare-fun e!253507 () Bool)

(declare-fun mapRes!18357 () Bool)

(assert (=> b!427569 (= e!253508 (and e!253507 mapRes!18357))))

(declare-fun condMapEmpty!18357 () Bool)

(declare-fun mapDefault!18357 () ValueCell!5235)

(assert (=> b!427569 (= condMapEmpty!18357 (= (arr!12526 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5235)) mapDefault!18357)))))

(declare-fun b!427570 () Bool)

(declare-fun e!253506 () Bool)

(assert (=> b!427570 (= e!253506 tp_is_empty!11157)))

(declare-fun b!427571 () Bool)

(declare-fun res!250816 () Bool)

(assert (=> b!427571 (=> (not res!250816) (not e!253509))))

(assert (=> b!427571 (= res!250816 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18357 () Bool)

(declare-fun tp!35544 () Bool)

(assert (=> mapNonEmpty!18357 (= mapRes!18357 (and tp!35544 e!253506))))

(declare-fun mapValue!18357 () ValueCell!5235)

(declare-fun mapRest!18357 () (Array (_ BitVec 32) ValueCell!5235))

(declare-fun mapKey!18357 () (_ BitVec 32))

(assert (=> mapNonEmpty!18357 (= (arr!12526 _values!549) (store mapRest!18357 mapKey!18357 mapValue!18357))))

(declare-fun b!427572 () Bool)

(declare-fun res!250819 () Bool)

(assert (=> b!427572 (=> (not res!250819) (not e!253505))))

(assert (=> b!427572 (= res!250819 (or (= (select (arr!12525 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12525 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18357 () Bool)

(assert (=> mapIsEmpty!18357 mapRes!18357))

(declare-fun b!427573 () Bool)

(declare-fun e!253504 () Bool)

(assert (=> b!427573 (= e!253509 e!253504)))

(declare-fun res!250823 () Bool)

(assert (=> b!427573 (=> (not res!250823) (not e!253504))))

(assert (=> b!427573 (= res!250823 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15981)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7392 0))(
  ( (tuple2!7393 (_1!3707 (_ BitVec 64)) (_2!3707 V!15981)) )
))
(declare-datatypes ((List!7405 0))(
  ( (Nil!7402) (Cons!7401 (h!8257 tuple2!7392) (t!12859 List!7405)) )
))
(declare-datatypes ((ListLongMap!6305 0))(
  ( (ListLongMap!6306 (toList!3168 List!7405)) )
))
(declare-fun lt!195348 () ListLongMap!6305)

(declare-fun zeroValue!515 () V!15981)

(declare-fun lt!195350 () array!26153)

(declare-fun getCurrentListMapNoExtraKeys!1371 (array!26151 array!26153 (_ BitVec 32) (_ BitVec 32) V!15981 V!15981 (_ BitVec 32) Int) ListLongMap!6305)

(assert (=> b!427573 (= lt!195348 (getCurrentListMapNoExtraKeys!1371 lt!195352 lt!195350 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15981)

(assert (=> b!427573 (= lt!195350 (array!26154 (store (arr!12526 _values!549) i!563 (ValueCellFull!5235 v!412)) (size!12878 _values!549)))))

(declare-fun lt!195346 () ListLongMap!6305)

(assert (=> b!427573 (= lt!195346 (getCurrentListMapNoExtraKeys!1371 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427574 () Bool)

(declare-fun res!250814 () Bool)

(assert (=> b!427574 (=> (not res!250814) (not e!253505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427574 (= res!250814 (validMask!0 mask!1025))))

(declare-fun b!427575 () Bool)

(declare-fun res!250812 () Bool)

(assert (=> b!427575 (=> (not res!250812) (not e!253505))))

(assert (=> b!427575 (= res!250812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427576 () Bool)

(declare-fun res!250821 () Bool)

(assert (=> b!427576 (=> (not res!250821) (not e!253509))))

(declare-datatypes ((List!7406 0))(
  ( (Nil!7403) (Cons!7402 (h!8258 (_ BitVec 64)) (t!12860 List!7406)) )
))
(declare-fun arrayNoDuplicates!0 (array!26151 (_ BitVec 32) List!7406) Bool)

(assert (=> b!427576 (= res!250821 (arrayNoDuplicates!0 lt!195352 #b00000000000000000000000000000000 Nil!7403))))

(declare-fun b!427577 () Bool)

(declare-fun res!250817 () Bool)

(assert (=> b!427577 (=> (not res!250817) (not e!253505))))

(assert (=> b!427577 (= res!250817 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7403))))

(declare-fun b!427578 () Bool)

(declare-fun res!250813 () Bool)

(assert (=> b!427578 (=> (not res!250813) (not e!253505))))

(declare-fun arrayContainsKey!0 (array!26151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427578 (= res!250813 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427579 () Bool)

(declare-fun e!253502 () Bool)

(assert (=> b!427579 (= e!253504 (not e!253502))))

(declare-fun res!250822 () Bool)

(assert (=> b!427579 (=> res!250822 e!253502)))

(assert (=> b!427579 (= res!250822 (not (validKeyInArray!0 (select (arr!12525 _keys!709) from!863))))))

(declare-fun lt!195351 () ListLongMap!6305)

(declare-fun lt!195347 () ListLongMap!6305)

(assert (=> b!427579 (= lt!195351 lt!195347)))

(declare-fun lt!195349 () ListLongMap!6305)

(declare-fun +!1323 (ListLongMap!6305 tuple2!7392) ListLongMap!6305)

(assert (=> b!427579 (= lt!195347 (+!1323 lt!195349 (tuple2!7393 k0!794 v!412)))))

(assert (=> b!427579 (= lt!195351 (getCurrentListMapNoExtraKeys!1371 lt!195352 lt!195350 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427579 (= lt!195349 (getCurrentListMapNoExtraKeys!1371 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12546 0))(
  ( (Unit!12547) )
))
(declare-fun lt!195353 () Unit!12546)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!517 (array!26151 array!26153 (_ BitVec 32) (_ BitVec 32) V!15981 V!15981 (_ BitVec 32) (_ BitVec 64) V!15981 (_ BitVec 32) Int) Unit!12546)

(assert (=> b!427579 (= lt!195353 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!517 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427580 () Bool)

(assert (=> b!427580 (= e!253502 true)))

(declare-fun get!6200 (ValueCell!5235 V!15981) V!15981)

(declare-fun dynLambda!751 (Int (_ BitVec 64)) V!15981)

(assert (=> b!427580 (= lt!195348 (+!1323 lt!195347 (tuple2!7393 (select (arr!12525 _keys!709) from!863) (get!6200 (select (arr!12526 _values!549) from!863) (dynLambda!751 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427581 () Bool)

(assert (=> b!427581 (= e!253507 tp_is_empty!11157)))

(declare-fun b!427582 () Bool)

(declare-fun res!250824 () Bool)

(assert (=> b!427582 (=> (not res!250824) (not e!253505))))

(assert (=> b!427582 (= res!250824 (and (= (size!12878 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12877 _keys!709) (size!12878 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39738 res!250815) b!427574))

(assert (= (and b!427574 res!250814) b!427582))

(assert (= (and b!427582 res!250824) b!427575))

(assert (= (and b!427575 res!250812) b!427577))

(assert (= (and b!427577 res!250817) b!427567))

(assert (= (and b!427567 res!250820) b!427566))

(assert (= (and b!427566 res!250818) b!427572))

(assert (= (and b!427572 res!250819) b!427578))

(assert (= (and b!427578 res!250813) b!427568))

(assert (= (and b!427568 res!250811) b!427576))

(assert (= (and b!427576 res!250821) b!427571))

(assert (= (and b!427571 res!250816) b!427573))

(assert (= (and b!427573 res!250823) b!427579))

(assert (= (and b!427579 (not res!250822)) b!427580))

(assert (= (and b!427569 condMapEmpty!18357) mapIsEmpty!18357))

(assert (= (and b!427569 (not condMapEmpty!18357)) mapNonEmpty!18357))

(get-info :version)

(assert (= (and mapNonEmpty!18357 ((_ is ValueCellFull!5235) mapValue!18357)) b!427570))

(assert (= (and b!427569 ((_ is ValueCellFull!5235) mapDefault!18357)) b!427581))

(assert (= start!39738 b!427569))

(declare-fun b_lambda!9093 () Bool)

(assert (=> (not b_lambda!9093) (not b!427580)))

(declare-fun t!12858 () Bool)

(declare-fun tb!3411 () Bool)

(assert (=> (and start!39738 (= defaultEntry!557 defaultEntry!557) t!12858) tb!3411))

(declare-fun result!6349 () Bool)

(assert (=> tb!3411 (= result!6349 tp_is_empty!11157)))

(assert (=> b!427580 t!12858))

(declare-fun b_and!17671 () Bool)

(assert (= b_and!17669 (and (=> t!12858 result!6349) b_and!17671)))

(declare-fun m!416057 () Bool)

(assert (=> b!427578 m!416057))

(declare-fun m!416059 () Bool)

(assert (=> b!427574 m!416059))

(declare-fun m!416061 () Bool)

(assert (=> b!427575 m!416061))

(declare-fun m!416063 () Bool)

(assert (=> b!427579 m!416063))

(declare-fun m!416065 () Bool)

(assert (=> b!427579 m!416065))

(declare-fun m!416067 () Bool)

(assert (=> b!427579 m!416067))

(assert (=> b!427579 m!416063))

(declare-fun m!416069 () Bool)

(assert (=> b!427579 m!416069))

(declare-fun m!416071 () Bool)

(assert (=> b!427579 m!416071))

(declare-fun m!416073 () Bool)

(assert (=> b!427579 m!416073))

(declare-fun m!416075 () Bool)

(assert (=> b!427577 m!416075))

(declare-fun m!416077 () Bool)

(assert (=> b!427572 m!416077))

(declare-fun m!416079 () Bool)

(assert (=> mapNonEmpty!18357 m!416079))

(declare-fun m!416081 () Bool)

(assert (=> b!427568 m!416081))

(declare-fun m!416083 () Bool)

(assert (=> b!427568 m!416083))

(declare-fun m!416085 () Bool)

(assert (=> b!427566 m!416085))

(assert (=> b!427580 m!416063))

(declare-fun m!416087 () Bool)

(assert (=> b!427580 m!416087))

(declare-fun m!416089 () Bool)

(assert (=> b!427580 m!416089))

(declare-fun m!416091 () Bool)

(assert (=> b!427580 m!416091))

(assert (=> b!427580 m!416089))

(assert (=> b!427580 m!416087))

(declare-fun m!416093 () Bool)

(assert (=> b!427580 m!416093))

(declare-fun m!416095 () Bool)

(assert (=> b!427573 m!416095))

(declare-fun m!416097 () Bool)

(assert (=> b!427573 m!416097))

(declare-fun m!416099 () Bool)

(assert (=> b!427573 m!416099))

(declare-fun m!416101 () Bool)

(assert (=> b!427576 m!416101))

(declare-fun m!416103 () Bool)

(assert (=> start!39738 m!416103))

(declare-fun m!416105 () Bool)

(assert (=> start!39738 m!416105))

(check-sat (not b!427579) (not b!427574) (not b_next!10005) (not mapNonEmpty!18357) (not b!427573) (not b!427578) (not b!427575) (not b!427576) (not b!427566) (not b!427568) (not b_lambda!9093) (not start!39738) tp_is_empty!11157 (not b!427580) (not b!427577) b_and!17671)
(check-sat b_and!17671 (not b_next!10005))
