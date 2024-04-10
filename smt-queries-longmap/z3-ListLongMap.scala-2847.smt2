; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41070 () Bool)

(assert start!41070)

(declare-fun b_free!10983 () Bool)

(declare-fun b_next!10983 () Bool)

(assert (=> start!41070 (= b_free!10983 (not b_next!10983))))

(declare-fun tp!38778 () Bool)

(declare-fun b_and!19173 () Bool)

(assert (=> start!41070 (= tp!38778 b_and!19173)))

(declare-fun b!458091 () Bool)

(declare-fun e!267471 () Bool)

(declare-fun e!267468 () Bool)

(assert (=> b!458091 (= e!267471 e!267468)))

(declare-fun res!273654 () Bool)

(assert (=> b!458091 (=> (not res!273654) (not e!267468))))

(declare-datatypes ((array!28443 0))(
  ( (array!28444 (arr!13664 (Array (_ BitVec 32) (_ BitVec 64))) (size!14016 (_ BitVec 32))) )
))
(declare-fun lt!207210 () array!28443)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28443 (_ BitVec 32)) Bool)

(assert (=> b!458091 (= res!273654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207210 mask!1025))))

(declare-fun _keys!709 () array!28443)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458091 (= lt!207210 (array!28444 (store (arr!13664 _keys!709) i!563 k0!794) (size!14016 _keys!709)))))

(declare-fun b!458092 () Bool)

(declare-fun res!273651 () Bool)

(assert (=> b!458092 (=> (not res!273651) (not e!267471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458092 (= res!273651 (validKeyInArray!0 k0!794))))

(declare-fun b!458093 () Bool)

(declare-fun res!273647 () Bool)

(assert (=> b!458093 (=> (not res!273647) (not e!267471))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17533 0))(
  ( (V!17534 (val!6205 Int)) )
))
(declare-datatypes ((ValueCell!5817 0))(
  ( (ValueCellFull!5817 (v!8475 V!17533)) (EmptyCell!5817) )
))
(declare-datatypes ((array!28445 0))(
  ( (array!28446 (arr!13665 (Array (_ BitVec 32) ValueCell!5817)) (size!14017 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28445)

(assert (=> b!458093 (= res!273647 (and (= (size!14017 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14016 _keys!709) (size!14017 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!458094 () Bool)

(declare-fun res!273643 () Bool)

(assert (=> b!458094 (=> (not res!273643) (not e!267471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458094 (= res!273643 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!20125 () Bool)

(declare-fun mapRes!20125 () Bool)

(assert (=> mapIsEmpty!20125 mapRes!20125))

(declare-fun b!458095 () Bool)

(declare-fun res!273650 () Bool)

(assert (=> b!458095 (=> (not res!273650) (not e!267471))))

(assert (=> b!458095 (= res!273650 (or (= (select (arr!13664 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13664 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458096 () Bool)

(declare-fun e!267472 () Bool)

(declare-fun e!267473 () Bool)

(assert (=> b!458096 (= e!267472 (not e!267473))))

(declare-fun res!273645 () Bool)

(assert (=> b!458096 (=> res!273645 e!267473)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!458096 (= res!273645 (not (validKeyInArray!0 (select (arr!13664 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8176 0))(
  ( (tuple2!8177 (_1!4099 (_ BitVec 64)) (_2!4099 V!17533)) )
))
(declare-datatypes ((List!8248 0))(
  ( (Nil!8245) (Cons!8244 (h!9100 tuple2!8176) (t!14110 List!8248)) )
))
(declare-datatypes ((ListLongMap!7089 0))(
  ( (ListLongMap!7090 (toList!3560 List!8248)) )
))
(declare-fun lt!207212 () ListLongMap!7089)

(declare-fun lt!207209 () ListLongMap!7089)

(assert (=> b!458096 (= lt!207212 lt!207209)))

(declare-fun v!412 () V!17533)

(declare-fun lt!207216 () ListLongMap!7089)

(declare-fun +!1596 (ListLongMap!7089 tuple2!8176) ListLongMap!7089)

(assert (=> b!458096 (= lt!207209 (+!1596 lt!207216 (tuple2!8177 k0!794 v!412)))))

(declare-fun minValue!515 () V!17533)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!207213 () array!28445)

(declare-fun zeroValue!515 () V!17533)

(declare-fun getCurrentListMapNoExtraKeys!1742 (array!28443 array!28445 (_ BitVec 32) (_ BitVec 32) V!17533 V!17533 (_ BitVec 32) Int) ListLongMap!7089)

(assert (=> b!458096 (= lt!207212 (getCurrentListMapNoExtraKeys!1742 lt!207210 lt!207213 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458096 (= lt!207216 (getCurrentListMapNoExtraKeys!1742 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13312 0))(
  ( (Unit!13313) )
))
(declare-fun lt!207215 () Unit!13312)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!755 (array!28443 array!28445 (_ BitVec 32) (_ BitVec 32) V!17533 V!17533 (_ BitVec 32) (_ BitVec 64) V!17533 (_ BitVec 32) Int) Unit!13312)

(assert (=> b!458096 (= lt!207215 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458097 () Bool)

(declare-fun e!267467 () Bool)

(declare-fun e!267470 () Bool)

(assert (=> b!458097 (= e!267467 (and e!267470 mapRes!20125))))

(declare-fun condMapEmpty!20125 () Bool)

(declare-fun mapDefault!20125 () ValueCell!5817)

(assert (=> b!458097 (= condMapEmpty!20125 (= (arr!13665 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5817)) mapDefault!20125)))))

(declare-fun b!458098 () Bool)

(declare-fun res!273641 () Bool)

(assert (=> b!458098 (=> (not res!273641) (not e!267471))))

(declare-datatypes ((List!8249 0))(
  ( (Nil!8246) (Cons!8245 (h!9101 (_ BitVec 64)) (t!14111 List!8249)) )
))
(declare-fun arrayNoDuplicates!0 (array!28443 (_ BitVec 32) List!8249) Bool)

(assert (=> b!458098 (= res!273641 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8246))))

(declare-fun b!458099 () Bool)

(declare-fun tp_is_empty!12321 () Bool)

(assert (=> b!458099 (= e!267470 tp_is_empty!12321)))

(declare-fun b!458100 () Bool)

(declare-fun res!273644 () Bool)

(assert (=> b!458100 (=> (not res!273644) (not e!267471))))

(assert (=> b!458100 (= res!273644 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14016 _keys!709))))))

(declare-fun b!458101 () Bool)

(declare-fun e!267474 () Bool)

(assert (=> b!458101 (= e!267474 tp_is_empty!12321)))

(declare-fun b!458102 () Bool)

(declare-fun res!273646 () Bool)

(assert (=> b!458102 (=> (not res!273646) (not e!267468))))

(assert (=> b!458102 (= res!273646 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!20125 () Bool)

(declare-fun tp!38779 () Bool)

(assert (=> mapNonEmpty!20125 (= mapRes!20125 (and tp!38779 e!267474))))

(declare-fun mapRest!20125 () (Array (_ BitVec 32) ValueCell!5817))

(declare-fun mapValue!20125 () ValueCell!5817)

(declare-fun mapKey!20125 () (_ BitVec 32))

(assert (=> mapNonEmpty!20125 (= (arr!13665 _values!549) (store mapRest!20125 mapKey!20125 mapValue!20125))))

(declare-fun res!273642 () Bool)

(assert (=> start!41070 (=> (not res!273642) (not e!267471))))

(assert (=> start!41070 (= res!273642 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14016 _keys!709))))))

(assert (=> start!41070 e!267471))

(assert (=> start!41070 tp_is_empty!12321))

(assert (=> start!41070 tp!38778))

(assert (=> start!41070 true))

(declare-fun array_inv!9892 (array!28445) Bool)

(assert (=> start!41070 (and (array_inv!9892 _values!549) e!267467)))

(declare-fun array_inv!9893 (array!28443) Bool)

(assert (=> start!41070 (array_inv!9893 _keys!709)))

(declare-fun b!458103 () Bool)

(assert (=> b!458103 (= e!267468 e!267472)))

(declare-fun res!273652 () Bool)

(assert (=> b!458103 (=> (not res!273652) (not e!267472))))

(assert (=> b!458103 (= res!273652 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207214 () ListLongMap!7089)

(assert (=> b!458103 (= lt!207214 (getCurrentListMapNoExtraKeys!1742 lt!207210 lt!207213 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458103 (= lt!207213 (array!28446 (store (arr!13665 _values!549) i!563 (ValueCellFull!5817 v!412)) (size!14017 _values!549)))))

(declare-fun lt!207211 () ListLongMap!7089)

(assert (=> b!458103 (= lt!207211 (getCurrentListMapNoExtraKeys!1742 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458104 () Bool)

(declare-fun res!273648 () Bool)

(assert (=> b!458104 (=> (not res!273648) (not e!267471))))

(declare-fun arrayContainsKey!0 (array!28443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458104 (= res!273648 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458105 () Bool)

(declare-fun res!273653 () Bool)

(assert (=> b!458105 (=> (not res!273653) (not e!267471))))

(assert (=> b!458105 (= res!273653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458106 () Bool)

(declare-fun res!273649 () Bool)

(assert (=> b!458106 (=> (not res!273649) (not e!267468))))

(assert (=> b!458106 (= res!273649 (arrayNoDuplicates!0 lt!207210 #b00000000000000000000000000000000 Nil!8246))))

(declare-fun b!458107 () Bool)

(assert (=> b!458107 (= e!267473 true)))

(declare-fun get!6729 (ValueCell!5817 V!17533) V!17533)

(declare-fun dynLambda!885 (Int (_ BitVec 64)) V!17533)

(assert (=> b!458107 (= lt!207214 (+!1596 lt!207209 (tuple2!8177 (select (arr!13664 _keys!709) from!863) (get!6729 (select (arr!13665 _values!549) from!863) (dynLambda!885 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!41070 res!273642) b!458094))

(assert (= (and b!458094 res!273643) b!458093))

(assert (= (and b!458093 res!273647) b!458105))

(assert (= (and b!458105 res!273653) b!458098))

(assert (= (and b!458098 res!273641) b!458100))

(assert (= (and b!458100 res!273644) b!458092))

(assert (= (and b!458092 res!273651) b!458095))

(assert (= (and b!458095 res!273650) b!458104))

(assert (= (and b!458104 res!273648) b!458091))

(assert (= (and b!458091 res!273654) b!458106))

(assert (= (and b!458106 res!273649) b!458102))

(assert (= (and b!458102 res!273646) b!458103))

(assert (= (and b!458103 res!273652) b!458096))

(assert (= (and b!458096 (not res!273645)) b!458107))

(assert (= (and b!458097 condMapEmpty!20125) mapIsEmpty!20125))

(assert (= (and b!458097 (not condMapEmpty!20125)) mapNonEmpty!20125))

(get-info :version)

(assert (= (and mapNonEmpty!20125 ((_ is ValueCellFull!5817) mapValue!20125)) b!458101))

(assert (= (and b!458097 ((_ is ValueCellFull!5817) mapDefault!20125)) b!458099))

(assert (= start!41070 b!458097))

(declare-fun b_lambda!9749 () Bool)

(assert (=> (not b_lambda!9749) (not b!458107)))

(declare-fun t!14109 () Bool)

(declare-fun tb!3819 () Bool)

(assert (=> (and start!41070 (= defaultEntry!557 defaultEntry!557) t!14109) tb!3819))

(declare-fun result!7179 () Bool)

(assert (=> tb!3819 (= result!7179 tp_is_empty!12321)))

(assert (=> b!458107 t!14109))

(declare-fun b_and!19175 () Bool)

(assert (= b_and!19173 (and (=> t!14109 result!7179) b_and!19175)))

(declare-fun m!441411 () Bool)

(assert (=> mapNonEmpty!20125 m!441411))

(declare-fun m!441413 () Bool)

(assert (=> b!458096 m!441413))

(declare-fun m!441415 () Bool)

(assert (=> b!458096 m!441415))

(declare-fun m!441417 () Bool)

(assert (=> b!458096 m!441417))

(declare-fun m!441419 () Bool)

(assert (=> b!458096 m!441419))

(declare-fun m!441421 () Bool)

(assert (=> b!458096 m!441421))

(declare-fun m!441423 () Bool)

(assert (=> b!458096 m!441423))

(assert (=> b!458096 m!441417))

(declare-fun m!441425 () Bool)

(assert (=> b!458092 m!441425))

(declare-fun m!441427 () Bool)

(assert (=> b!458104 m!441427))

(declare-fun m!441429 () Bool)

(assert (=> b!458105 m!441429))

(declare-fun m!441431 () Bool)

(assert (=> b!458095 m!441431))

(assert (=> b!458107 m!441417))

(declare-fun m!441433 () Bool)

(assert (=> b!458107 m!441433))

(declare-fun m!441435 () Bool)

(assert (=> b!458107 m!441435))

(declare-fun m!441437 () Bool)

(assert (=> b!458107 m!441437))

(assert (=> b!458107 m!441435))

(assert (=> b!458107 m!441433))

(declare-fun m!441439 () Bool)

(assert (=> b!458107 m!441439))

(declare-fun m!441441 () Bool)

(assert (=> start!41070 m!441441))

(declare-fun m!441443 () Bool)

(assert (=> start!41070 m!441443))

(declare-fun m!441445 () Bool)

(assert (=> b!458094 m!441445))

(declare-fun m!441447 () Bool)

(assert (=> b!458091 m!441447))

(declare-fun m!441449 () Bool)

(assert (=> b!458091 m!441449))

(declare-fun m!441451 () Bool)

(assert (=> b!458106 m!441451))

(declare-fun m!441453 () Bool)

(assert (=> b!458098 m!441453))

(declare-fun m!441455 () Bool)

(assert (=> b!458103 m!441455))

(declare-fun m!441457 () Bool)

(assert (=> b!458103 m!441457))

(declare-fun m!441459 () Bool)

(assert (=> b!458103 m!441459))

(check-sat (not b_next!10983) (not mapNonEmpty!20125) (not b!458098) (not start!41070) b_and!19175 (not b!458096) (not b!458094) (not b!458104) (not b!458092) (not b!458106) tp_is_empty!12321 (not b!458103) (not b_lambda!9749) (not b!458107) (not b!458105) (not b!458091))
(check-sat b_and!19175 (not b_next!10983))
