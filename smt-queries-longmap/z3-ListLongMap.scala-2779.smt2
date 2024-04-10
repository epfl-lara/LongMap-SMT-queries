; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40564 () Bool)

(assert start!40564)

(declare-fun b_free!10575 () Bool)

(declare-fun b_next!10575 () Bool)

(assert (=> start!40564 (= b_free!10575 (not b_next!10575))))

(declare-fun tp!37545 () Bool)

(declare-fun b_and!18583 () Bool)

(assert (=> start!40564 (= tp!37545 b_and!18583)))

(declare-fun b!447107 () Bool)

(declare-fun res!265479 () Bool)

(declare-fun e!262597 () Bool)

(assert (=> b!447107 (=> (not res!265479) (not e!262597))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447107 (= res!265479 (bvsle from!863 i!563))))

(declare-fun b!447108 () Bool)

(declare-fun res!265470 () Bool)

(declare-fun e!262595 () Bool)

(assert (=> b!447108 (=> (not res!265470) (not e!262595))))

(declare-datatypes ((array!27633 0))(
  ( (array!27634 (arr!13262 (Array (_ BitVec 32) (_ BitVec 64))) (size!13614 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27633)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16989 0))(
  ( (V!16990 (val!6001 Int)) )
))
(declare-datatypes ((ValueCell!5613 0))(
  ( (ValueCellFull!5613 (v!8256 V!16989)) (EmptyCell!5613) )
))
(declare-datatypes ((array!27635 0))(
  ( (array!27636 (arr!13263 (Array (_ BitVec 32) ValueCell!5613)) (size!13615 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27635)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!447108 (= res!265470 (and (= (size!13615 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13614 _keys!709) (size!13615 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447109 () Bool)

(declare-fun res!265468 () Bool)

(assert (=> b!447109 (=> (not res!265468) (not e!262595))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447109 (= res!265468 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447110 () Bool)

(declare-fun e!262593 () Bool)

(declare-fun tp_is_empty!11913 () Bool)

(assert (=> b!447110 (= e!262593 tp_is_empty!11913)))

(declare-fun b!447111 () Bool)

(declare-fun e!262598 () Bool)

(assert (=> b!447111 (= e!262598 tp_is_empty!11913)))

(declare-fun b!447112 () Bool)

(assert (=> b!447112 (= e!262597 false)))

(declare-fun minValue!515 () V!16989)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16989)

(declare-datatypes ((tuple2!7870 0))(
  ( (tuple2!7871 (_1!3946 (_ BitVec 64)) (_2!3946 V!16989)) )
))
(declare-datatypes ((List!7933 0))(
  ( (Nil!7930) (Cons!7929 (h!8785 tuple2!7870) (t!13695 List!7933)) )
))
(declare-datatypes ((ListLongMap!6783 0))(
  ( (ListLongMap!6784 (toList!3407 List!7933)) )
))
(declare-fun lt!203913 () ListLongMap!6783)

(declare-fun getCurrentListMapNoExtraKeys!1593 (array!27633 array!27635 (_ BitVec 32) (_ BitVec 32) V!16989 V!16989 (_ BitVec 32) Int) ListLongMap!6783)

(assert (=> b!447112 (= lt!203913 (getCurrentListMapNoExtraKeys!1593 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19503 () Bool)

(declare-fun mapRes!19503 () Bool)

(declare-fun tp!37544 () Bool)

(assert (=> mapNonEmpty!19503 (= mapRes!19503 (and tp!37544 e!262598))))

(declare-fun mapValue!19503 () ValueCell!5613)

(declare-fun mapRest!19503 () (Array (_ BitVec 32) ValueCell!5613))

(declare-fun mapKey!19503 () (_ BitVec 32))

(assert (=> mapNonEmpty!19503 (= (arr!13263 _values!549) (store mapRest!19503 mapKey!19503 mapValue!19503))))

(declare-fun b!447114 () Bool)

(declare-fun res!265472 () Bool)

(assert (=> b!447114 (=> (not res!265472) (not e!262595))))

(declare-datatypes ((List!7934 0))(
  ( (Nil!7931) (Cons!7930 (h!8786 (_ BitVec 64)) (t!13696 List!7934)) )
))
(declare-fun arrayNoDuplicates!0 (array!27633 (_ BitVec 32) List!7934) Bool)

(assert (=> b!447114 (= res!265472 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7931))))

(declare-fun mapIsEmpty!19503 () Bool)

(assert (=> mapIsEmpty!19503 mapRes!19503))

(declare-fun b!447115 () Bool)

(declare-fun res!265471 () Bool)

(assert (=> b!447115 (=> (not res!265471) (not e!262597))))

(declare-fun lt!203912 () array!27633)

(assert (=> b!447115 (= res!265471 (arrayNoDuplicates!0 lt!203912 #b00000000000000000000000000000000 Nil!7931))))

(declare-fun b!447116 () Bool)

(declare-fun res!265477 () Bool)

(assert (=> b!447116 (=> (not res!265477) (not e!262595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27633 (_ BitVec 32)) Bool)

(assert (=> b!447116 (= res!265477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447117 () Bool)

(declare-fun res!265476 () Bool)

(assert (=> b!447117 (=> (not res!265476) (not e!262595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447117 (= res!265476 (validKeyInArray!0 k0!794))))

(declare-fun b!447118 () Bool)

(declare-fun res!265473 () Bool)

(assert (=> b!447118 (=> (not res!265473) (not e!262595))))

(assert (=> b!447118 (= res!265473 (or (= (select (arr!13262 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13262 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447119 () Bool)

(declare-fun e!262594 () Bool)

(assert (=> b!447119 (= e!262594 (and e!262593 mapRes!19503))))

(declare-fun condMapEmpty!19503 () Bool)

(declare-fun mapDefault!19503 () ValueCell!5613)

(assert (=> b!447119 (= condMapEmpty!19503 (= (arr!13263 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5613)) mapDefault!19503)))))

(declare-fun b!447120 () Bool)

(assert (=> b!447120 (= e!262595 e!262597)))

(declare-fun res!265475 () Bool)

(assert (=> b!447120 (=> (not res!265475) (not e!262597))))

(assert (=> b!447120 (= res!265475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203912 mask!1025))))

(assert (=> b!447120 (= lt!203912 (array!27634 (store (arr!13262 _keys!709) i!563 k0!794) (size!13614 _keys!709)))))

(declare-fun b!447121 () Bool)

(declare-fun res!265474 () Bool)

(assert (=> b!447121 (=> (not res!265474) (not e!262595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447121 (= res!265474 (validMask!0 mask!1025))))

(declare-fun res!265478 () Bool)

(assert (=> start!40564 (=> (not res!265478) (not e!262595))))

(assert (=> start!40564 (= res!265478 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13614 _keys!709))))))

(assert (=> start!40564 e!262595))

(assert (=> start!40564 tp_is_empty!11913))

(assert (=> start!40564 tp!37545))

(assert (=> start!40564 true))

(declare-fun array_inv!9618 (array!27635) Bool)

(assert (=> start!40564 (and (array_inv!9618 _values!549) e!262594)))

(declare-fun array_inv!9619 (array!27633) Bool)

(assert (=> start!40564 (array_inv!9619 _keys!709)))

(declare-fun b!447113 () Bool)

(declare-fun res!265469 () Bool)

(assert (=> b!447113 (=> (not res!265469) (not e!262595))))

(assert (=> b!447113 (= res!265469 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13614 _keys!709))))))

(assert (= (and start!40564 res!265478) b!447121))

(assert (= (and b!447121 res!265474) b!447108))

(assert (= (and b!447108 res!265470) b!447116))

(assert (= (and b!447116 res!265477) b!447114))

(assert (= (and b!447114 res!265472) b!447113))

(assert (= (and b!447113 res!265469) b!447117))

(assert (= (and b!447117 res!265476) b!447118))

(assert (= (and b!447118 res!265473) b!447109))

(assert (= (and b!447109 res!265468) b!447120))

(assert (= (and b!447120 res!265475) b!447115))

(assert (= (and b!447115 res!265471) b!447107))

(assert (= (and b!447107 res!265479) b!447112))

(assert (= (and b!447119 condMapEmpty!19503) mapIsEmpty!19503))

(assert (= (and b!447119 (not condMapEmpty!19503)) mapNonEmpty!19503))

(get-info :version)

(assert (= (and mapNonEmpty!19503 ((_ is ValueCellFull!5613) mapValue!19503)) b!447111))

(assert (= (and b!447119 ((_ is ValueCellFull!5613) mapDefault!19503)) b!447110))

(assert (= start!40564 b!447119))

(declare-fun m!432123 () Bool)

(assert (=> b!447120 m!432123))

(declare-fun m!432125 () Bool)

(assert (=> b!447120 m!432125))

(declare-fun m!432127 () Bool)

(assert (=> b!447116 m!432127))

(declare-fun m!432129 () Bool)

(assert (=> b!447115 m!432129))

(declare-fun m!432131 () Bool)

(assert (=> b!447117 m!432131))

(declare-fun m!432133 () Bool)

(assert (=> b!447114 m!432133))

(declare-fun m!432135 () Bool)

(assert (=> start!40564 m!432135))

(declare-fun m!432137 () Bool)

(assert (=> start!40564 m!432137))

(declare-fun m!432139 () Bool)

(assert (=> b!447112 m!432139))

(declare-fun m!432141 () Bool)

(assert (=> b!447118 m!432141))

(declare-fun m!432143 () Bool)

(assert (=> b!447109 m!432143))

(declare-fun m!432145 () Bool)

(assert (=> mapNonEmpty!19503 m!432145))

(declare-fun m!432147 () Bool)

(assert (=> b!447121 m!432147))

(check-sat (not b!447116) (not b_next!10575) (not b!447109) (not b!447115) tp_is_empty!11913 (not b!447112) b_and!18583 (not b!447114) (not mapNonEmpty!19503) (not b!447120) (not b!447121) (not start!40564) (not b!447117))
(check-sat b_and!18583 (not b_next!10575))
