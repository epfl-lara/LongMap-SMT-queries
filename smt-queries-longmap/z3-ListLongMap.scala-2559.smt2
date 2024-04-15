; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39158 () Bool)

(assert start!39158)

(declare-fun b_free!9439 () Bool)

(declare-fun b_next!9439 () Bool)

(assert (=> start!39158 (= b_free!9439 (not b_next!9439))))

(declare-fun tp!33845 () Bool)

(declare-fun b_and!16799 () Bool)

(assert (=> start!39158 (= tp!33845 b_and!16799)))

(declare-fun b!412211 () Bool)

(declare-fun res!239404 () Bool)

(declare-fun e!246649 () Bool)

(assert (=> b!412211 (=> (not res!239404) (not e!246649))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412211 (= res!239404 (bvsle from!863 i!563))))

(declare-fun b!412213 () Bool)

(declare-fun res!239406 () Bool)

(declare-fun e!246653 () Bool)

(assert (=> b!412213 (=> (not res!239406) (not e!246653))))

(declare-datatypes ((array!25033 0))(
  ( (array!25034 (arr!11966 (Array (_ BitVec 32) (_ BitVec 64))) (size!12319 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25033)

(declare-datatypes ((List!6928 0))(
  ( (Nil!6925) (Cons!6924 (h!7780 (_ BitVec 64)) (t!12093 List!6928)) )
))
(declare-fun arrayNoDuplicates!0 (array!25033 (_ BitVec 32) List!6928) Bool)

(assert (=> b!412213 (= res!239406 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6925))))

(declare-fun b!412214 () Bool)

(declare-fun e!246654 () Bool)

(declare-fun e!246652 () Bool)

(declare-fun mapRes!17508 () Bool)

(assert (=> b!412214 (= e!246654 (and e!246652 mapRes!17508))))

(declare-fun condMapEmpty!17508 () Bool)

(declare-datatypes ((V!15227 0))(
  ( (V!15228 (val!5340 Int)) )
))
(declare-datatypes ((ValueCell!4952 0))(
  ( (ValueCellFull!4952 (v!7581 V!15227)) (EmptyCell!4952) )
))
(declare-datatypes ((array!25035 0))(
  ( (array!25036 (arr!11967 (Array (_ BitVec 32) ValueCell!4952)) (size!12320 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25035)

(declare-fun mapDefault!17508 () ValueCell!4952)

(assert (=> b!412214 (= condMapEmpty!17508 (= (arr!11967 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4952)) mapDefault!17508)))))

(declare-fun b!412215 () Bool)

(declare-fun res!239402 () Bool)

(assert (=> b!412215 (=> (not res!239402) (not e!246653))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412215 (= res!239402 (validMask!0 mask!1025))))

(declare-fun b!412216 () Bool)

(declare-fun res!239400 () Bool)

(assert (=> b!412216 (=> (not res!239400) (not e!246653))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412216 (= res!239400 (and (= (size!12320 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12319 _keys!709) (size!12320 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412217 () Bool)

(declare-fun res!239401 () Bool)

(assert (=> b!412217 (=> (not res!239401) (not e!246653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25033 (_ BitVec 32)) Bool)

(assert (=> b!412217 (= res!239401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412218 () Bool)

(declare-fun res!239397 () Bool)

(assert (=> b!412218 (=> (not res!239397) (not e!246653))))

(assert (=> b!412218 (= res!239397 (or (= (select (arr!11966 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11966 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412219 () Bool)

(declare-fun e!246650 () Bool)

(declare-fun tp_is_empty!10591 () Bool)

(assert (=> b!412219 (= e!246650 tp_is_empty!10591)))

(declare-fun b!412220 () Bool)

(declare-fun res!239399 () Bool)

(assert (=> b!412220 (=> (not res!239399) (not e!246653))))

(assert (=> b!412220 (= res!239399 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12319 _keys!709))))))

(declare-fun b!412221 () Bool)

(declare-fun res!239395 () Bool)

(assert (=> b!412221 (=> (not res!239395) (not e!246653))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412221 (= res!239395 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412222 () Bool)

(assert (=> b!412222 (= e!246649 false)))

(declare-fun minValue!515 () V!15227)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!189255 () array!25033)

(declare-fun v!412 () V!15227)

(declare-datatypes ((tuple2!6912 0))(
  ( (tuple2!6913 (_1!3467 (_ BitVec 64)) (_2!3467 V!15227)) )
))
(declare-datatypes ((List!6929 0))(
  ( (Nil!6926) (Cons!6925 (h!7781 tuple2!6912) (t!12094 List!6929)) )
))
(declare-datatypes ((ListLongMap!5815 0))(
  ( (ListLongMap!5816 (toList!2923 List!6929)) )
))
(declare-fun lt!189257 () ListLongMap!5815)

(declare-fun zeroValue!515 () V!15227)

(declare-fun getCurrentListMapNoExtraKeys!1137 (array!25033 array!25035 (_ BitVec 32) (_ BitVec 32) V!15227 V!15227 (_ BitVec 32) Int) ListLongMap!5815)

(assert (=> b!412222 (= lt!189257 (getCurrentListMapNoExtraKeys!1137 lt!189255 (array!25036 (store (arr!11967 _values!549) i!563 (ValueCellFull!4952 v!412)) (size!12320 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189256 () ListLongMap!5815)

(assert (=> b!412222 (= lt!189256 (getCurrentListMapNoExtraKeys!1137 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412223 () Bool)

(declare-fun res!239396 () Bool)

(assert (=> b!412223 (=> (not res!239396) (not e!246649))))

(assert (=> b!412223 (= res!239396 (arrayNoDuplicates!0 lt!189255 #b00000000000000000000000000000000 Nil!6925))))

(declare-fun b!412224 () Bool)

(assert (=> b!412224 (= e!246653 e!246649)))

(declare-fun res!239405 () Bool)

(assert (=> b!412224 (=> (not res!239405) (not e!246649))))

(assert (=> b!412224 (= res!239405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189255 mask!1025))))

(assert (=> b!412224 (= lt!189255 (array!25034 (store (arr!11966 _keys!709) i!563 k0!794) (size!12319 _keys!709)))))

(declare-fun mapNonEmpty!17508 () Bool)

(declare-fun tp!33846 () Bool)

(assert (=> mapNonEmpty!17508 (= mapRes!17508 (and tp!33846 e!246650))))

(declare-fun mapRest!17508 () (Array (_ BitVec 32) ValueCell!4952))

(declare-fun mapKey!17508 () (_ BitVec 32))

(declare-fun mapValue!17508 () ValueCell!4952)

(assert (=> mapNonEmpty!17508 (= (arr!11967 _values!549) (store mapRest!17508 mapKey!17508 mapValue!17508))))

(declare-fun mapIsEmpty!17508 () Bool)

(assert (=> mapIsEmpty!17508 mapRes!17508))

(declare-fun b!412225 () Bool)

(assert (=> b!412225 (= e!246652 tp_is_empty!10591)))

(declare-fun res!239398 () Bool)

(assert (=> start!39158 (=> (not res!239398) (not e!246653))))

(assert (=> start!39158 (= res!239398 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12319 _keys!709))))))

(assert (=> start!39158 e!246653))

(assert (=> start!39158 tp_is_empty!10591))

(assert (=> start!39158 tp!33845))

(assert (=> start!39158 true))

(declare-fun array_inv!8780 (array!25035) Bool)

(assert (=> start!39158 (and (array_inv!8780 _values!549) e!246654)))

(declare-fun array_inv!8781 (array!25033) Bool)

(assert (=> start!39158 (array_inv!8781 _keys!709)))

(declare-fun b!412212 () Bool)

(declare-fun res!239403 () Bool)

(assert (=> b!412212 (=> (not res!239403) (not e!246653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412212 (= res!239403 (validKeyInArray!0 k0!794))))

(assert (= (and start!39158 res!239398) b!412215))

(assert (= (and b!412215 res!239402) b!412216))

(assert (= (and b!412216 res!239400) b!412217))

(assert (= (and b!412217 res!239401) b!412213))

(assert (= (and b!412213 res!239406) b!412220))

(assert (= (and b!412220 res!239399) b!412212))

(assert (= (and b!412212 res!239403) b!412218))

(assert (= (and b!412218 res!239397) b!412221))

(assert (= (and b!412221 res!239395) b!412224))

(assert (= (and b!412224 res!239405) b!412223))

(assert (= (and b!412223 res!239396) b!412211))

(assert (= (and b!412211 res!239404) b!412222))

(assert (= (and b!412214 condMapEmpty!17508) mapIsEmpty!17508))

(assert (= (and b!412214 (not condMapEmpty!17508)) mapNonEmpty!17508))

(get-info :version)

(assert (= (and mapNonEmpty!17508 ((_ is ValueCellFull!4952) mapValue!17508)) b!412219))

(assert (= (and b!412214 ((_ is ValueCellFull!4952) mapDefault!17508)) b!412225))

(assert (= start!39158 b!412214))

(declare-fun m!401559 () Bool)

(assert (=> b!412218 m!401559))

(declare-fun m!401561 () Bool)

(assert (=> b!412223 m!401561))

(declare-fun m!401563 () Bool)

(assert (=> b!412213 m!401563))

(declare-fun m!401565 () Bool)

(assert (=> mapNonEmpty!17508 m!401565))

(declare-fun m!401567 () Bool)

(assert (=> b!412222 m!401567))

(declare-fun m!401569 () Bool)

(assert (=> b!412222 m!401569))

(declare-fun m!401571 () Bool)

(assert (=> b!412222 m!401571))

(declare-fun m!401573 () Bool)

(assert (=> b!412212 m!401573))

(declare-fun m!401575 () Bool)

(assert (=> start!39158 m!401575))

(declare-fun m!401577 () Bool)

(assert (=> start!39158 m!401577))

(declare-fun m!401579 () Bool)

(assert (=> b!412215 m!401579))

(declare-fun m!401581 () Bool)

(assert (=> b!412224 m!401581))

(declare-fun m!401583 () Bool)

(assert (=> b!412224 m!401583))

(declare-fun m!401585 () Bool)

(assert (=> b!412217 m!401585))

(declare-fun m!401587 () Bool)

(assert (=> b!412221 m!401587))

(check-sat (not b!412213) tp_is_empty!10591 (not b_next!9439) (not b!412223) (not b!412217) (not mapNonEmpty!17508) (not b!412212) (not start!39158) (not b!412221) (not b!412224) (not b!412215) (not b!412222) b_and!16799)
(check-sat b_and!16799 (not b_next!9439))
