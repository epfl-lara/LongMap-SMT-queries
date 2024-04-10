; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40654 () Bool)

(assert start!40654)

(declare-fun b_free!10665 () Bool)

(declare-fun b_next!10665 () Bool)

(assert (=> start!40654 (= b_free!10665 (not b_next!10665))))

(declare-fun tp!37814 () Bool)

(declare-fun b_and!18673 () Bool)

(assert (=> start!40654 (= tp!37814 b_and!18673)))

(declare-fun b!449132 () Bool)

(declare-fun res!267095 () Bool)

(declare-fun e!263406 () Bool)

(assert (=> b!449132 (=> (not res!267095) (not e!263406))))

(declare-datatypes ((array!27813 0))(
  ( (array!27814 (arr!13352 (Array (_ BitVec 32) (_ BitVec 64))) (size!13704 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27813)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17109 0))(
  ( (V!17110 (val!6046 Int)) )
))
(declare-datatypes ((ValueCell!5658 0))(
  ( (ValueCellFull!5658 (v!8301 V!17109)) (EmptyCell!5658) )
))
(declare-datatypes ((array!27815 0))(
  ( (array!27816 (arr!13353 (Array (_ BitVec 32) ValueCell!5658)) (size!13705 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27815)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!449132 (= res!267095 (and (= (size!13705 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13704 _keys!709) (size!13705 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449133 () Bool)

(declare-fun res!267094 () Bool)

(assert (=> b!449133 (=> (not res!267094) (not e!263406))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449133 (= res!267094 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449134 () Bool)

(declare-fun e!263404 () Bool)

(assert (=> b!449134 (= e!263404 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!204304 () array!27813)

(declare-fun minValue!515 () V!17109)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17109)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7936 0))(
  ( (tuple2!7937 (_1!3979 (_ BitVec 64)) (_2!3979 V!17109)) )
))
(declare-datatypes ((List!8001 0))(
  ( (Nil!7998) (Cons!7997 (h!8853 tuple2!7936) (t!13763 List!8001)) )
))
(declare-datatypes ((ListLongMap!6849 0))(
  ( (ListLongMap!6850 (toList!3440 List!8001)) )
))
(declare-fun lt!204306 () ListLongMap!6849)

(declare-fun v!412 () V!17109)

(declare-fun getCurrentListMapNoExtraKeys!1626 (array!27813 array!27815 (_ BitVec 32) (_ BitVec 32) V!17109 V!17109 (_ BitVec 32) Int) ListLongMap!6849)

(assert (=> b!449134 (= lt!204306 (getCurrentListMapNoExtraKeys!1626 lt!204304 (array!27816 (store (arr!13353 _values!549) i!563 (ValueCellFull!5658 v!412)) (size!13705 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204305 () ListLongMap!6849)

(assert (=> b!449134 (= lt!204305 (getCurrentListMapNoExtraKeys!1626 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449135 () Bool)

(declare-fun res!267089 () Bool)

(assert (=> b!449135 (=> (not res!267089) (not e!263404))))

(declare-datatypes ((List!8002 0))(
  ( (Nil!7999) (Cons!7998 (h!8854 (_ BitVec 64)) (t!13764 List!8002)) )
))
(declare-fun arrayNoDuplicates!0 (array!27813 (_ BitVec 32) List!8002) Bool)

(assert (=> b!449135 (= res!267089 (arrayNoDuplicates!0 lt!204304 #b00000000000000000000000000000000 Nil!7999))))

(declare-fun b!449136 () Bool)

(declare-fun res!267097 () Bool)

(assert (=> b!449136 (=> (not res!267097) (not e!263406))))

(assert (=> b!449136 (= res!267097 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7999))))

(declare-fun res!267098 () Bool)

(assert (=> start!40654 (=> (not res!267098) (not e!263406))))

(assert (=> start!40654 (= res!267098 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13704 _keys!709))))))

(assert (=> start!40654 e!263406))

(declare-fun tp_is_empty!12003 () Bool)

(assert (=> start!40654 tp_is_empty!12003))

(assert (=> start!40654 tp!37814))

(assert (=> start!40654 true))

(declare-fun e!263403 () Bool)

(declare-fun array_inv!9676 (array!27815) Bool)

(assert (=> start!40654 (and (array_inv!9676 _values!549) e!263403)))

(declare-fun array_inv!9677 (array!27813) Bool)

(assert (=> start!40654 (array_inv!9677 _keys!709)))

(declare-fun b!449137 () Bool)

(declare-fun res!267092 () Bool)

(assert (=> b!449137 (=> (not res!267092) (not e!263406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449137 (= res!267092 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19638 () Bool)

(declare-fun mapRes!19638 () Bool)

(assert (=> mapIsEmpty!19638 mapRes!19638))

(declare-fun mapNonEmpty!19638 () Bool)

(declare-fun tp!37815 () Bool)

(declare-fun e!263407 () Bool)

(assert (=> mapNonEmpty!19638 (= mapRes!19638 (and tp!37815 e!263407))))

(declare-fun mapRest!19638 () (Array (_ BitVec 32) ValueCell!5658))

(declare-fun mapValue!19638 () ValueCell!5658)

(declare-fun mapKey!19638 () (_ BitVec 32))

(assert (=> mapNonEmpty!19638 (= (arr!13353 _values!549) (store mapRest!19638 mapKey!19638 mapValue!19638))))

(declare-fun b!449138 () Bool)

(declare-fun res!267093 () Bool)

(assert (=> b!449138 (=> (not res!267093) (not e!263406))))

(assert (=> b!449138 (= res!267093 (or (= (select (arr!13352 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13352 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449139 () Bool)

(declare-fun res!267090 () Bool)

(assert (=> b!449139 (=> (not res!267090) (not e!263404))))

(assert (=> b!449139 (= res!267090 (bvsle from!863 i!563))))

(declare-fun b!449140 () Bool)

(assert (=> b!449140 (= e!263406 e!263404)))

(declare-fun res!267096 () Bool)

(assert (=> b!449140 (=> (not res!267096) (not e!263404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27813 (_ BitVec 32)) Bool)

(assert (=> b!449140 (= res!267096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204304 mask!1025))))

(assert (=> b!449140 (= lt!204304 (array!27814 (store (arr!13352 _keys!709) i!563 k0!794) (size!13704 _keys!709)))))

(declare-fun b!449141 () Bool)

(declare-fun e!263408 () Bool)

(assert (=> b!449141 (= e!263408 tp_is_empty!12003)))

(declare-fun b!449142 () Bool)

(declare-fun res!267099 () Bool)

(assert (=> b!449142 (=> (not res!267099) (not e!263406))))

(assert (=> b!449142 (= res!267099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449143 () Bool)

(declare-fun res!267088 () Bool)

(assert (=> b!449143 (=> (not res!267088) (not e!263406))))

(assert (=> b!449143 (= res!267088 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13704 _keys!709))))))

(declare-fun b!449144 () Bool)

(assert (=> b!449144 (= e!263407 tp_is_empty!12003)))

(declare-fun b!449145 () Bool)

(declare-fun res!267091 () Bool)

(assert (=> b!449145 (=> (not res!267091) (not e!263406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449145 (= res!267091 (validMask!0 mask!1025))))

(declare-fun b!449146 () Bool)

(assert (=> b!449146 (= e!263403 (and e!263408 mapRes!19638))))

(declare-fun condMapEmpty!19638 () Bool)

(declare-fun mapDefault!19638 () ValueCell!5658)

(assert (=> b!449146 (= condMapEmpty!19638 (= (arr!13353 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5658)) mapDefault!19638)))))

(assert (= (and start!40654 res!267098) b!449145))

(assert (= (and b!449145 res!267091) b!449132))

(assert (= (and b!449132 res!267095) b!449142))

(assert (= (and b!449142 res!267099) b!449136))

(assert (= (and b!449136 res!267097) b!449143))

(assert (= (and b!449143 res!267088) b!449137))

(assert (= (and b!449137 res!267092) b!449138))

(assert (= (and b!449138 res!267093) b!449133))

(assert (= (and b!449133 res!267094) b!449140))

(assert (= (and b!449140 res!267096) b!449135))

(assert (= (and b!449135 res!267089) b!449139))

(assert (= (and b!449139 res!267090) b!449134))

(assert (= (and b!449146 condMapEmpty!19638) mapIsEmpty!19638))

(assert (= (and b!449146 (not condMapEmpty!19638)) mapNonEmpty!19638))

(get-info :version)

(assert (= (and mapNonEmpty!19638 ((_ is ValueCellFull!5658) mapValue!19638)) b!449144))

(assert (= (and b!449146 ((_ is ValueCellFull!5658) mapDefault!19638)) b!449141))

(assert (= start!40654 b!449146))

(declare-fun m!433453 () Bool)

(assert (=> b!449136 m!433453))

(declare-fun m!433455 () Bool)

(assert (=> b!449140 m!433455))

(declare-fun m!433457 () Bool)

(assert (=> b!449140 m!433457))

(declare-fun m!433459 () Bool)

(assert (=> b!449134 m!433459))

(declare-fun m!433461 () Bool)

(assert (=> b!449134 m!433461))

(declare-fun m!433463 () Bool)

(assert (=> b!449134 m!433463))

(declare-fun m!433465 () Bool)

(assert (=> b!449135 m!433465))

(declare-fun m!433467 () Bool)

(assert (=> b!449137 m!433467))

(declare-fun m!433469 () Bool)

(assert (=> mapNonEmpty!19638 m!433469))

(declare-fun m!433471 () Bool)

(assert (=> b!449138 m!433471))

(declare-fun m!433473 () Bool)

(assert (=> b!449133 m!433473))

(declare-fun m!433475 () Bool)

(assert (=> start!40654 m!433475))

(declare-fun m!433477 () Bool)

(assert (=> start!40654 m!433477))

(declare-fun m!433479 () Bool)

(assert (=> b!449142 m!433479))

(declare-fun m!433481 () Bool)

(assert (=> b!449145 m!433481))

(check-sat (not start!40654) (not b!449145) (not b_next!10665) tp_is_empty!12003 (not b!449142) (not b!449135) (not b!449136) b_and!18673 (not b!449137) (not b!449133) (not mapNonEmpty!19638) (not b!449140) (not b!449134))
(check-sat b_and!18673 (not b_next!10665))
