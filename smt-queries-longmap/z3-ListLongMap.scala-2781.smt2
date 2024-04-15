; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40560 () Bool)

(assert start!40560)

(declare-fun b_free!10585 () Bool)

(declare-fun b_next!10585 () Bool)

(assert (=> start!40560 (= b_free!10585 (not b_next!10585))))

(declare-fun tp!37574 () Bool)

(declare-fun b_and!18567 () Bool)

(assert (=> start!40560 (= tp!37574 b_and!18567)))

(declare-fun b!447061 () Bool)

(declare-fun res!265526 () Bool)

(declare-fun e!262512 () Bool)

(assert (=> b!447061 (=> (not res!265526) (not e!262512))))

(declare-datatypes ((array!27655 0))(
  ( (array!27656 (arr!13273 (Array (_ BitVec 32) (_ BitVec 64))) (size!13626 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27655)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17003 0))(
  ( (V!17004 (val!6006 Int)) )
))
(declare-datatypes ((ValueCell!5618 0))(
  ( (ValueCellFull!5618 (v!8255 V!17003)) (EmptyCell!5618) )
))
(declare-datatypes ((array!27657 0))(
  ( (array!27658 (arr!13274 (Array (_ BitVec 32) ValueCell!5618)) (size!13627 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27657)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!447061 (= res!265526 (and (= (size!13627 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13626 _keys!709) (size!13627 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447062 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun e!262510 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!447062 (= e!262510 (and (= from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13626 _keys!709)))))))

(declare-fun minValue!515 () V!17003)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7886 0))(
  ( (tuple2!7887 (_1!3954 (_ BitVec 64)) (_2!3954 V!17003)) )
))
(declare-datatypes ((List!7946 0))(
  ( (Nil!7943) (Cons!7942 (h!8798 tuple2!7886) (t!13699 List!7946)) )
))
(declare-datatypes ((ListLongMap!6789 0))(
  ( (ListLongMap!6790 (toList!3410 List!7946)) )
))
(declare-fun lt!203711 () ListLongMap!6789)

(declare-fun v!412 () V!17003)

(declare-fun lt!203710 () array!27655)

(declare-fun zeroValue!515 () V!17003)

(declare-fun getCurrentListMapNoExtraKeys!1608 (array!27655 array!27657 (_ BitVec 32) (_ BitVec 32) V!17003 V!17003 (_ BitVec 32) Int) ListLongMap!6789)

(assert (=> b!447062 (= lt!203711 (getCurrentListMapNoExtraKeys!1608 lt!203710 (array!27658 (store (arr!13274 _values!549) i!563 (ValueCellFull!5618 v!412)) (size!13627 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203712 () ListLongMap!6789)

(assert (=> b!447062 (= lt!203712 (getCurrentListMapNoExtraKeys!1608 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447063 () Bool)

(declare-fun e!262513 () Bool)

(declare-fun e!262514 () Bool)

(declare-fun mapRes!19518 () Bool)

(assert (=> b!447063 (= e!262513 (and e!262514 mapRes!19518))))

(declare-fun condMapEmpty!19518 () Bool)

(declare-fun mapDefault!19518 () ValueCell!5618)

(assert (=> b!447063 (= condMapEmpty!19518 (= (arr!13274 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5618)) mapDefault!19518)))))

(declare-fun b!447064 () Bool)

(declare-fun tp_is_empty!11923 () Bool)

(assert (=> b!447064 (= e!262514 tp_is_empty!11923)))

(declare-fun res!265527 () Bool)

(assert (=> start!40560 (=> (not res!265527) (not e!262512))))

(assert (=> start!40560 (= res!265527 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13626 _keys!709))))))

(assert (=> start!40560 e!262512))

(assert (=> start!40560 tp_is_empty!11923))

(assert (=> start!40560 tp!37574))

(assert (=> start!40560 true))

(declare-fun array_inv!9674 (array!27657) Bool)

(assert (=> start!40560 (and (array_inv!9674 _values!549) e!262513)))

(declare-fun array_inv!9675 (array!27655) Bool)

(assert (=> start!40560 (array_inv!9675 _keys!709)))

(declare-fun b!447065 () Bool)

(declare-fun res!265519 () Bool)

(assert (=> b!447065 (=> (not res!265519) (not e!262512))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447065 (= res!265519 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447066 () Bool)

(declare-fun res!265529 () Bool)

(assert (=> b!447066 (=> (not res!265529) (not e!262512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447066 (= res!265529 (validKeyInArray!0 k0!794))))

(declare-fun b!447067 () Bool)

(declare-fun res!265521 () Bool)

(assert (=> b!447067 (=> (not res!265521) (not e!262512))))

(assert (=> b!447067 (= res!265521 (or (= (select (arr!13273 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13273 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447068 () Bool)

(declare-fun res!265525 () Bool)

(assert (=> b!447068 (=> (not res!265525) (not e!262512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447068 (= res!265525 (validMask!0 mask!1025))))

(declare-fun b!447069 () Bool)

(declare-fun res!265522 () Bool)

(assert (=> b!447069 (=> (not res!265522) (not e!262512))))

(declare-datatypes ((List!7947 0))(
  ( (Nil!7944) (Cons!7943 (h!8799 (_ BitVec 64)) (t!13700 List!7947)) )
))
(declare-fun arrayNoDuplicates!0 (array!27655 (_ BitVec 32) List!7947) Bool)

(assert (=> b!447069 (= res!265522 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7944))))

(declare-fun b!447070 () Bool)

(declare-fun res!265523 () Bool)

(assert (=> b!447070 (=> (not res!265523) (not e!262512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27655 (_ BitVec 32)) Bool)

(assert (=> b!447070 (= res!265523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447071 () Bool)

(declare-fun res!265528 () Bool)

(assert (=> b!447071 (=> (not res!265528) (not e!262512))))

(assert (=> b!447071 (= res!265528 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13626 _keys!709))))))

(declare-fun mapNonEmpty!19518 () Bool)

(declare-fun tp!37575 () Bool)

(declare-fun e!262509 () Bool)

(assert (=> mapNonEmpty!19518 (= mapRes!19518 (and tp!37575 e!262509))))

(declare-fun mapKey!19518 () (_ BitVec 32))

(declare-fun mapRest!19518 () (Array (_ BitVec 32) ValueCell!5618))

(declare-fun mapValue!19518 () ValueCell!5618)

(assert (=> mapNonEmpty!19518 (= (arr!13274 _values!549) (store mapRest!19518 mapKey!19518 mapValue!19518))))

(declare-fun b!447072 () Bool)

(assert (=> b!447072 (= e!262509 tp_is_empty!11923)))

(declare-fun b!447073 () Bool)

(declare-fun res!265520 () Bool)

(assert (=> b!447073 (=> (not res!265520) (not e!262510))))

(assert (=> b!447073 (= res!265520 (arrayNoDuplicates!0 lt!203710 #b00000000000000000000000000000000 Nil!7944))))

(declare-fun b!447074 () Bool)

(assert (=> b!447074 (= e!262512 e!262510)))

(declare-fun res!265530 () Bool)

(assert (=> b!447074 (=> (not res!265530) (not e!262510))))

(assert (=> b!447074 (= res!265530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203710 mask!1025))))

(assert (=> b!447074 (= lt!203710 (array!27656 (store (arr!13273 _keys!709) i!563 k0!794) (size!13626 _keys!709)))))

(declare-fun b!447075 () Bool)

(declare-fun res!265524 () Bool)

(assert (=> b!447075 (=> (not res!265524) (not e!262510))))

(assert (=> b!447075 (= res!265524 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19518 () Bool)

(assert (=> mapIsEmpty!19518 mapRes!19518))

(assert (= (and start!40560 res!265527) b!447068))

(assert (= (and b!447068 res!265525) b!447061))

(assert (= (and b!447061 res!265526) b!447070))

(assert (= (and b!447070 res!265523) b!447069))

(assert (= (and b!447069 res!265522) b!447071))

(assert (= (and b!447071 res!265528) b!447066))

(assert (= (and b!447066 res!265529) b!447067))

(assert (= (and b!447067 res!265521) b!447065))

(assert (= (and b!447065 res!265519) b!447074))

(assert (= (and b!447074 res!265530) b!447073))

(assert (= (and b!447073 res!265520) b!447075))

(assert (= (and b!447075 res!265524) b!447062))

(assert (= (and b!447063 condMapEmpty!19518) mapIsEmpty!19518))

(assert (= (and b!447063 (not condMapEmpty!19518)) mapNonEmpty!19518))

(get-info :version)

(assert (= (and mapNonEmpty!19518 ((_ is ValueCellFull!5618) mapValue!19518)) b!447072))

(assert (= (and b!447063 ((_ is ValueCellFull!5618) mapDefault!19518)) b!447064))

(assert (= start!40560 b!447063))

(declare-fun m!431521 () Bool)

(assert (=> b!447066 m!431521))

(declare-fun m!431523 () Bool)

(assert (=> b!447070 m!431523))

(declare-fun m!431525 () Bool)

(assert (=> b!447067 m!431525))

(declare-fun m!431527 () Bool)

(assert (=> b!447074 m!431527))

(declare-fun m!431529 () Bool)

(assert (=> b!447074 m!431529))

(declare-fun m!431531 () Bool)

(assert (=> b!447065 m!431531))

(declare-fun m!431533 () Bool)

(assert (=> b!447073 m!431533))

(declare-fun m!431535 () Bool)

(assert (=> mapNonEmpty!19518 m!431535))

(declare-fun m!431537 () Bool)

(assert (=> start!40560 m!431537))

(declare-fun m!431539 () Bool)

(assert (=> start!40560 m!431539))

(declare-fun m!431541 () Bool)

(assert (=> b!447062 m!431541))

(declare-fun m!431543 () Bool)

(assert (=> b!447062 m!431543))

(declare-fun m!431545 () Bool)

(assert (=> b!447062 m!431545))

(declare-fun m!431547 () Bool)

(assert (=> b!447068 m!431547))

(declare-fun m!431549 () Bool)

(assert (=> b!447069 m!431549))

(check-sat (not b!447065) (not b!447070) (not mapNonEmpty!19518) (not b!447066) (not b_next!10585) (not b!447068) (not b!447073) (not b!447062) (not start!40560) (not b!447069) (not b!447074) tp_is_empty!11923 b_and!18567)
(check-sat b_and!18567 (not b_next!10585))
