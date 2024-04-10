; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40176 () Bool)

(assert start!40176)

(declare-fun b_free!10443 () Bool)

(declare-fun b_next!10443 () Bool)

(assert (=> start!40176 (= b_free!10443 (not b_next!10443))))

(declare-fun tp!36857 () Bool)

(declare-fun b_and!18411 () Bool)

(assert (=> start!40176 (= tp!36857 b_and!18411)))

(declare-fun b!439988 () Bool)

(declare-fun res!260136 () Bool)

(declare-fun e!259296 () Bool)

(assert (=> b!439988 (=> (not res!260136) (not e!259296))))

(declare-datatypes ((array!27005 0))(
  ( (array!27006 (arr!12952 (Array (_ BitVec 32) (_ BitVec 64))) (size!13304 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27005)

(declare-datatypes ((List!7758 0))(
  ( (Nil!7755) (Cons!7754 (h!8610 (_ BitVec 64)) (t!13514 List!7758)) )
))
(declare-fun arrayNoDuplicates!0 (array!27005 (_ BitVec 32) List!7758) Bool)

(assert (=> b!439988 (= res!260136 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7755))))

(declare-fun b!439989 () Bool)

(declare-fun e!259298 () Bool)

(assert (=> b!439989 (= e!259296 e!259298)))

(declare-fun res!260134 () Bool)

(assert (=> b!439989 (=> (not res!260134) (not e!259298))))

(declare-fun lt!202441 () array!27005)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27005 (_ BitVec 32)) Bool)

(assert (=> b!439989 (= res!260134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202441 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!439989 (= lt!202441 (array!27006 (store (arr!12952 _keys!709) i!563 k0!794) (size!13304 _keys!709)))))

(declare-fun b!439990 () Bool)

(declare-fun res!260141 () Bool)

(assert (=> b!439990 (=> (not res!260141) (not e!259296))))

(declare-fun arrayContainsKey!0 (array!27005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439990 (= res!260141 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!260139 () Bool)

(assert (=> start!40176 (=> (not res!260139) (not e!259296))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40176 (= res!260139 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13304 _keys!709))))))

(assert (=> start!40176 e!259296))

(declare-fun tp_is_empty!11595 () Bool)

(assert (=> start!40176 tp_is_empty!11595))

(assert (=> start!40176 tp!36857))

(assert (=> start!40176 true))

(declare-datatypes ((V!16565 0))(
  ( (V!16566 (val!5842 Int)) )
))
(declare-datatypes ((ValueCell!5454 0))(
  ( (ValueCellFull!5454 (v!8089 V!16565)) (EmptyCell!5454) )
))
(declare-datatypes ((array!27007 0))(
  ( (array!27008 (arr!12953 (Array (_ BitVec 32) ValueCell!5454)) (size!13305 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27007)

(declare-fun e!259294 () Bool)

(declare-fun array_inv!9404 (array!27007) Bool)

(assert (=> start!40176 (and (array_inv!9404 _values!549) e!259294)))

(declare-fun array_inv!9405 (array!27005) Bool)

(assert (=> start!40176 (array_inv!9405 _keys!709)))

(declare-fun b!439991 () Bool)

(declare-fun e!259295 () Bool)

(declare-fun mapRes!19014 () Bool)

(assert (=> b!439991 (= e!259294 (and e!259295 mapRes!19014))))

(declare-fun condMapEmpty!19014 () Bool)

(declare-fun mapDefault!19014 () ValueCell!5454)

(assert (=> b!439991 (= condMapEmpty!19014 (= (arr!12953 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5454)) mapDefault!19014)))))

(declare-fun b!439992 () Bool)

(declare-fun res!260142 () Bool)

(assert (=> b!439992 (=> (not res!260142) (not e!259296))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!439992 (= res!260142 (and (= (size!13305 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13304 _keys!709) (size!13305 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439993 () Bool)

(assert (=> b!439993 (= e!259295 tp_is_empty!11595)))

(declare-fun mapIsEmpty!19014 () Bool)

(assert (=> mapIsEmpty!19014 mapRes!19014))

(declare-fun b!439994 () Bool)

(declare-fun res!260138 () Bool)

(assert (=> b!439994 (=> (not res!260138) (not e!259296))))

(assert (=> b!439994 (= res!260138 (or (= (select (arr!12952 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12952 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439995 () Bool)

(declare-fun res!260137 () Bool)

(assert (=> b!439995 (=> (not res!260137) (not e!259298))))

(assert (=> b!439995 (= res!260137 (arrayNoDuplicates!0 lt!202441 #b00000000000000000000000000000000 Nil!7755))))

(declare-fun b!439996 () Bool)

(declare-fun res!260135 () Bool)

(assert (=> b!439996 (=> (not res!260135) (not e!259296))))

(assert (=> b!439996 (= res!260135 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13304 _keys!709))))))

(declare-fun b!439997 () Bool)

(declare-fun e!259297 () Bool)

(assert (=> b!439997 (= e!259298 e!259297)))

(declare-fun res!260132 () Bool)

(assert (=> b!439997 (=> (not res!260132) (not e!259297))))

(assert (=> b!439997 (= res!260132 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16565)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16565)

(declare-fun lt!202445 () array!27007)

(declare-datatypes ((tuple2!7760 0))(
  ( (tuple2!7761 (_1!3891 (_ BitVec 64)) (_2!3891 V!16565)) )
))
(declare-datatypes ((List!7759 0))(
  ( (Nil!7756) (Cons!7755 (h!8611 tuple2!7760) (t!13515 List!7759)) )
))
(declare-datatypes ((ListLongMap!6673 0))(
  ( (ListLongMap!6674 (toList!3352 List!7759)) )
))
(declare-fun lt!202444 () ListLongMap!6673)

(declare-fun getCurrentListMapNoExtraKeys!1541 (array!27005 array!27007 (_ BitVec 32) (_ BitVec 32) V!16565 V!16565 (_ BitVec 32) Int) ListLongMap!6673)

(assert (=> b!439997 (= lt!202444 (getCurrentListMapNoExtraKeys!1541 lt!202441 lt!202445 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16565)

(assert (=> b!439997 (= lt!202445 (array!27008 (store (arr!12953 _values!549) i!563 (ValueCellFull!5454 v!412)) (size!13305 _values!549)))))

(declare-fun lt!202443 () ListLongMap!6673)

(assert (=> b!439997 (= lt!202443 (getCurrentListMapNoExtraKeys!1541 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439998 () Bool)

(declare-fun res!260130 () Bool)

(assert (=> b!439998 (=> (not res!260130) (not e!259296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439998 (= res!260130 (validKeyInArray!0 k0!794))))

(declare-fun b!439999 () Bool)

(declare-fun e!259293 () Bool)

(assert (=> b!439999 (= e!259293 tp_is_empty!11595)))

(declare-fun b!440000 () Bool)

(declare-fun res!260140 () Bool)

(assert (=> b!440000 (=> (not res!260140) (not e!259296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440000 (= res!260140 (validMask!0 mask!1025))))

(declare-fun b!440001 () Bool)

(declare-fun res!260133 () Bool)

(assert (=> b!440001 (=> (not res!260133) (not e!259296))))

(assert (=> b!440001 (= res!260133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440002 () Bool)

(assert (=> b!440002 (= e!259297 (not true))))

(declare-fun +!1492 (ListLongMap!6673 tuple2!7760) ListLongMap!6673)

(assert (=> b!440002 (= (getCurrentListMapNoExtraKeys!1541 lt!202441 lt!202445 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1492 (getCurrentListMapNoExtraKeys!1541 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7761 k0!794 v!412)))))

(declare-datatypes ((Unit!13088 0))(
  ( (Unit!13089) )
))
(declare-fun lt!202442 () Unit!13088)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!661 (array!27005 array!27007 (_ BitVec 32) (_ BitVec 32) V!16565 V!16565 (_ BitVec 32) (_ BitVec 64) V!16565 (_ BitVec 32) Int) Unit!13088)

(assert (=> b!440002 (= lt!202442 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!661 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19014 () Bool)

(declare-fun tp!36858 () Bool)

(assert (=> mapNonEmpty!19014 (= mapRes!19014 (and tp!36858 e!259293))))

(declare-fun mapValue!19014 () ValueCell!5454)

(declare-fun mapKey!19014 () (_ BitVec 32))

(declare-fun mapRest!19014 () (Array (_ BitVec 32) ValueCell!5454))

(assert (=> mapNonEmpty!19014 (= (arr!12953 _values!549) (store mapRest!19014 mapKey!19014 mapValue!19014))))

(declare-fun b!440003 () Bool)

(declare-fun res!260131 () Bool)

(assert (=> b!440003 (=> (not res!260131) (not e!259298))))

(assert (=> b!440003 (= res!260131 (bvsle from!863 i!563))))

(assert (= (and start!40176 res!260139) b!440000))

(assert (= (and b!440000 res!260140) b!439992))

(assert (= (and b!439992 res!260142) b!440001))

(assert (= (and b!440001 res!260133) b!439988))

(assert (= (and b!439988 res!260136) b!439996))

(assert (= (and b!439996 res!260135) b!439998))

(assert (= (and b!439998 res!260130) b!439994))

(assert (= (and b!439994 res!260138) b!439990))

(assert (= (and b!439990 res!260141) b!439989))

(assert (= (and b!439989 res!260134) b!439995))

(assert (= (and b!439995 res!260137) b!440003))

(assert (= (and b!440003 res!260131) b!439997))

(assert (= (and b!439997 res!260132) b!440002))

(assert (= (and b!439991 condMapEmpty!19014) mapIsEmpty!19014))

(assert (= (and b!439991 (not condMapEmpty!19014)) mapNonEmpty!19014))

(get-info :version)

(assert (= (and mapNonEmpty!19014 ((_ is ValueCellFull!5454) mapValue!19014)) b!439999))

(assert (= (and b!439991 ((_ is ValueCellFull!5454) mapDefault!19014)) b!439993))

(assert (= start!40176 b!439991))

(declare-fun m!427127 () Bool)

(assert (=> b!439988 m!427127))

(declare-fun m!427129 () Bool)

(assert (=> b!439997 m!427129))

(declare-fun m!427131 () Bool)

(assert (=> b!439997 m!427131))

(declare-fun m!427133 () Bool)

(assert (=> b!439997 m!427133))

(declare-fun m!427135 () Bool)

(assert (=> start!40176 m!427135))

(declare-fun m!427137 () Bool)

(assert (=> start!40176 m!427137))

(declare-fun m!427139 () Bool)

(assert (=> b!439998 m!427139))

(declare-fun m!427141 () Bool)

(assert (=> b!439990 m!427141))

(declare-fun m!427143 () Bool)

(assert (=> b!440000 m!427143))

(declare-fun m!427145 () Bool)

(assert (=> b!440001 m!427145))

(declare-fun m!427147 () Bool)

(assert (=> b!439989 m!427147))

(declare-fun m!427149 () Bool)

(assert (=> b!439989 m!427149))

(declare-fun m!427151 () Bool)

(assert (=> b!440002 m!427151))

(declare-fun m!427153 () Bool)

(assert (=> b!440002 m!427153))

(assert (=> b!440002 m!427153))

(declare-fun m!427155 () Bool)

(assert (=> b!440002 m!427155))

(declare-fun m!427157 () Bool)

(assert (=> b!440002 m!427157))

(declare-fun m!427159 () Bool)

(assert (=> b!439995 m!427159))

(declare-fun m!427161 () Bool)

(assert (=> b!439994 m!427161))

(declare-fun m!427163 () Bool)

(assert (=> mapNonEmpty!19014 m!427163))

(check-sat b_and!18411 (not b!440002) (not start!40176) (not b!439997) (not b!439989) (not b!439998) (not mapNonEmpty!19014) (not b!439988) (not b!439990) (not b!440001) (not b!439995) tp_is_empty!11595 (not b!440000) (not b_next!10443))
(check-sat b_and!18411 (not b_next!10443))
