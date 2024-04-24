; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40100 () Bool)

(assert start!40100)

(declare-fun b_free!10381 () Bool)

(declare-fun b_next!10381 () Bool)

(assert (=> start!40100 (= b_free!10381 (not b_next!10381))))

(declare-fun tp!36671 () Bool)

(declare-fun b_and!18363 () Bool)

(assert (=> start!40100 (= tp!36671 b_and!18363)))

(declare-fun b!438451 () Bool)

(declare-fun e!258612 () Bool)

(declare-fun e!258615 () Bool)

(assert (=> b!438451 (= e!258612 e!258615)))

(declare-fun res!258923 () Bool)

(assert (=> b!438451 (=> (not res!258923) (not e!258615))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438451 (= res!258923 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16483 0))(
  ( (V!16484 (val!5811 Int)) )
))
(declare-fun minValue!515 () V!16483)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16483)

(declare-datatypes ((array!26888 0))(
  ( (array!26889 (arr!12893 (Array (_ BitVec 32) (_ BitVec 64))) (size!13245 (_ BitVec 32))) )
))
(declare-fun lt!201999 () array!26888)

(declare-datatypes ((ValueCell!5423 0))(
  ( (ValueCellFull!5423 (v!8059 V!16483)) (EmptyCell!5423) )
))
(declare-datatypes ((array!26890 0))(
  ( (array!26891 (arr!12894 (Array (_ BitVec 32) ValueCell!5423)) (size!13246 (_ BitVec 32))) )
))
(declare-fun lt!201998 () array!26890)

(declare-datatypes ((tuple2!7614 0))(
  ( (tuple2!7615 (_1!3818 (_ BitVec 64)) (_2!3818 V!16483)) )
))
(declare-datatypes ((List!7602 0))(
  ( (Nil!7599) (Cons!7598 (h!8454 tuple2!7614) (t!13350 List!7602)) )
))
(declare-datatypes ((ListLongMap!6529 0))(
  ( (ListLongMap!6530 (toList!3280 List!7602)) )
))
(declare-fun lt!201997 () ListLongMap!6529)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1513 (array!26888 array!26890 (_ BitVec 32) (_ BitVec 32) V!16483 V!16483 (_ BitVec 32) Int) ListLongMap!6529)

(assert (=> b!438451 (= lt!201997 (getCurrentListMapNoExtraKeys!1513 lt!201999 lt!201998 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26890)

(declare-fun v!412 () V!16483)

(assert (=> b!438451 (= lt!201998 (array!26891 (store (arr!12894 _values!549) i!563 (ValueCellFull!5423 v!412)) (size!13246 _values!549)))))

(declare-fun lt!201996 () ListLongMap!6529)

(declare-fun _keys!709 () array!26888)

(assert (=> b!438451 (= lt!201996 (getCurrentListMapNoExtraKeys!1513 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438453 () Bool)

(declare-fun res!258926 () Bool)

(declare-fun e!258614 () Bool)

(assert (=> b!438453 (=> (not res!258926) (not e!258614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26888 (_ BitVec 32)) Bool)

(assert (=> b!438453 (= res!258926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18921 () Bool)

(declare-fun mapRes!18921 () Bool)

(assert (=> mapIsEmpty!18921 mapRes!18921))

(declare-fun b!438454 () Bool)

(declare-fun res!258920 () Bool)

(assert (=> b!438454 (=> (not res!258920) (not e!258614))))

(assert (=> b!438454 (= res!258920 (or (= (select (arr!12893 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12893 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438455 () Bool)

(assert (=> b!438455 (= e!258615 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1476 (ListLongMap!6529 tuple2!7614) ListLongMap!6529)

(assert (=> b!438455 (= (getCurrentListMapNoExtraKeys!1513 lt!201999 lt!201998 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1476 (getCurrentListMapNoExtraKeys!1513 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7615 k0!794 v!412)))))

(declare-datatypes ((Unit!13027 0))(
  ( (Unit!13028) )
))
(declare-fun lt!201995 () Unit!13027)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!636 (array!26888 array!26890 (_ BitVec 32) (_ BitVec 32) V!16483 V!16483 (_ BitVec 32) (_ BitVec 64) V!16483 (_ BitVec 32) Int) Unit!13027)

(assert (=> b!438455 (= lt!201995 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!636 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438456 () Bool)

(declare-fun res!258921 () Bool)

(assert (=> b!438456 (=> (not res!258921) (not e!258614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438456 (= res!258921 (validKeyInArray!0 k0!794))))

(declare-fun b!438457 () Bool)

(declare-fun res!258919 () Bool)

(assert (=> b!438457 (=> (not res!258919) (not e!258614))))

(declare-datatypes ((List!7603 0))(
  ( (Nil!7600) (Cons!7599 (h!8455 (_ BitVec 64)) (t!13351 List!7603)) )
))
(declare-fun arrayNoDuplicates!0 (array!26888 (_ BitVec 32) List!7603) Bool)

(assert (=> b!438457 (= res!258919 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7600))))

(declare-fun b!438458 () Bool)

(declare-fun res!258924 () Bool)

(assert (=> b!438458 (=> (not res!258924) (not e!258614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438458 (= res!258924 (validMask!0 mask!1025))))

(declare-fun b!438459 () Bool)

(declare-fun res!258929 () Bool)

(assert (=> b!438459 (=> (not res!258929) (not e!258614))))

(assert (=> b!438459 (= res!258929 (and (= (size!13246 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13245 _keys!709) (size!13246 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438460 () Bool)

(declare-fun e!258611 () Bool)

(declare-fun tp_is_empty!11533 () Bool)

(assert (=> b!438460 (= e!258611 tp_is_empty!11533)))

(declare-fun b!438461 () Bool)

(declare-fun e!258616 () Bool)

(assert (=> b!438461 (= e!258616 (and e!258611 mapRes!18921))))

(declare-fun condMapEmpty!18921 () Bool)

(declare-fun mapDefault!18921 () ValueCell!5423)

(assert (=> b!438461 (= condMapEmpty!18921 (= (arr!12894 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5423)) mapDefault!18921)))))

(declare-fun res!258927 () Bool)

(assert (=> start!40100 (=> (not res!258927) (not e!258614))))

(assert (=> start!40100 (= res!258927 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13245 _keys!709))))))

(assert (=> start!40100 e!258614))

(assert (=> start!40100 tp_is_empty!11533))

(assert (=> start!40100 tp!36671))

(assert (=> start!40100 true))

(declare-fun array_inv!9430 (array!26890) Bool)

(assert (=> start!40100 (and (array_inv!9430 _values!549) e!258616)))

(declare-fun array_inv!9431 (array!26888) Bool)

(assert (=> start!40100 (array_inv!9431 _keys!709)))

(declare-fun b!438452 () Bool)

(declare-fun e!258613 () Bool)

(assert (=> b!438452 (= e!258613 tp_is_empty!11533)))

(declare-fun mapNonEmpty!18921 () Bool)

(declare-fun tp!36672 () Bool)

(assert (=> mapNonEmpty!18921 (= mapRes!18921 (and tp!36672 e!258613))))

(declare-fun mapRest!18921 () (Array (_ BitVec 32) ValueCell!5423))

(declare-fun mapKey!18921 () (_ BitVec 32))

(declare-fun mapValue!18921 () ValueCell!5423)

(assert (=> mapNonEmpty!18921 (= (arr!12894 _values!549) (store mapRest!18921 mapKey!18921 mapValue!18921))))

(declare-fun b!438462 () Bool)

(declare-fun res!258922 () Bool)

(assert (=> b!438462 (=> (not res!258922) (not e!258614))))

(assert (=> b!438462 (= res!258922 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13245 _keys!709))))))

(declare-fun b!438463 () Bool)

(assert (=> b!438463 (= e!258614 e!258612)))

(declare-fun res!258928 () Bool)

(assert (=> b!438463 (=> (not res!258928) (not e!258612))))

(assert (=> b!438463 (= res!258928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201999 mask!1025))))

(assert (=> b!438463 (= lt!201999 (array!26889 (store (arr!12893 _keys!709) i!563 k0!794) (size!13245 _keys!709)))))

(declare-fun b!438464 () Bool)

(declare-fun res!258918 () Bool)

(assert (=> b!438464 (=> (not res!258918) (not e!258612))))

(assert (=> b!438464 (= res!258918 (bvsle from!863 i!563))))

(declare-fun b!438465 () Bool)

(declare-fun res!258930 () Bool)

(assert (=> b!438465 (=> (not res!258930) (not e!258612))))

(assert (=> b!438465 (= res!258930 (arrayNoDuplicates!0 lt!201999 #b00000000000000000000000000000000 Nil!7600))))

(declare-fun b!438466 () Bool)

(declare-fun res!258925 () Bool)

(assert (=> b!438466 (=> (not res!258925) (not e!258614))))

(declare-fun arrayContainsKey!0 (array!26888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438466 (= res!258925 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40100 res!258927) b!438458))

(assert (= (and b!438458 res!258924) b!438459))

(assert (= (and b!438459 res!258929) b!438453))

(assert (= (and b!438453 res!258926) b!438457))

(assert (= (and b!438457 res!258919) b!438462))

(assert (= (and b!438462 res!258922) b!438456))

(assert (= (and b!438456 res!258921) b!438454))

(assert (= (and b!438454 res!258920) b!438466))

(assert (= (and b!438466 res!258925) b!438463))

(assert (= (and b!438463 res!258928) b!438465))

(assert (= (and b!438465 res!258930) b!438464))

(assert (= (and b!438464 res!258918) b!438451))

(assert (= (and b!438451 res!258923) b!438455))

(assert (= (and b!438461 condMapEmpty!18921) mapIsEmpty!18921))

(assert (= (and b!438461 (not condMapEmpty!18921)) mapNonEmpty!18921))

(get-info :version)

(assert (= (and mapNonEmpty!18921 ((_ is ValueCellFull!5423) mapValue!18921)) b!438452))

(assert (= (and b!438461 ((_ is ValueCellFull!5423) mapDefault!18921)) b!438460))

(assert (= start!40100 b!438461))

(declare-fun m!426167 () Bool)

(assert (=> b!438465 m!426167))

(declare-fun m!426169 () Bool)

(assert (=> b!438463 m!426169))

(declare-fun m!426171 () Bool)

(assert (=> b!438463 m!426171))

(declare-fun m!426173 () Bool)

(assert (=> b!438454 m!426173))

(declare-fun m!426175 () Bool)

(assert (=> b!438456 m!426175))

(declare-fun m!426177 () Bool)

(assert (=> b!438451 m!426177))

(declare-fun m!426179 () Bool)

(assert (=> b!438451 m!426179))

(declare-fun m!426181 () Bool)

(assert (=> b!438451 m!426181))

(declare-fun m!426183 () Bool)

(assert (=> b!438466 m!426183))

(declare-fun m!426185 () Bool)

(assert (=> b!438458 m!426185))

(declare-fun m!426187 () Bool)

(assert (=> b!438455 m!426187))

(declare-fun m!426189 () Bool)

(assert (=> b!438455 m!426189))

(assert (=> b!438455 m!426189))

(declare-fun m!426191 () Bool)

(assert (=> b!438455 m!426191))

(declare-fun m!426193 () Bool)

(assert (=> b!438455 m!426193))

(declare-fun m!426195 () Bool)

(assert (=> b!438457 m!426195))

(declare-fun m!426197 () Bool)

(assert (=> mapNonEmpty!18921 m!426197))

(declare-fun m!426199 () Bool)

(assert (=> b!438453 m!426199))

(declare-fun m!426201 () Bool)

(assert (=> start!40100 m!426201))

(declare-fun m!426203 () Bool)

(assert (=> start!40100 m!426203))

(check-sat b_and!18363 tp_is_empty!11533 (not mapNonEmpty!18921) (not b!438466) (not b!438458) (not b!438453) (not b_next!10381) (not b!438457) (not start!40100) (not b!438465) (not b!438451) (not b!438456) (not b!438455) (not b!438463))
(check-sat b_and!18363 (not b_next!10381))
