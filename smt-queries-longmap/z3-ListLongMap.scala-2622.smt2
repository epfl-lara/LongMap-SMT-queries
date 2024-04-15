; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39536 () Bool)

(assert start!39536)

(declare-fun b_free!9817 () Bool)

(declare-fun b_next!9817 () Bool)

(assert (=> start!39536 (= b_free!9817 (not b_next!9817))))

(declare-fun tp!34980 () Bool)

(declare-fun b_and!17447 () Bool)

(assert (=> start!39536 (= tp!34980 b_and!17447)))

(declare-fun b!422858 () Bool)

(declare-fun e!251439 () Bool)

(declare-fun tp_is_empty!10969 () Bool)

(assert (=> b!422858 (= e!251439 tp_is_empty!10969)))

(declare-fun b!422859 () Bool)

(declare-fun res!247104 () Bool)

(declare-fun e!251438 () Bool)

(assert (=> b!422859 (=> (not res!247104) (not e!251438))))

(declare-datatypes ((array!25767 0))(
  ( (array!25768 (arr!12333 (Array (_ BitVec 32) (_ BitVec 64))) (size!12686 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25767)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422859 (= res!247104 (or (= (select (arr!12333 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12333 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422860 () Bool)

(declare-fun res!247100 () Bool)

(assert (=> b!422860 (=> (not res!247100) (not e!251438))))

(assert (=> b!422860 (= res!247100 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12686 _keys!709))))))

(declare-fun b!422861 () Bool)

(declare-fun e!251437 () Bool)

(assert (=> b!422861 (= e!251438 e!251437)))

(declare-fun res!247099 () Bool)

(assert (=> b!422861 (=> (not res!247099) (not e!251437))))

(declare-fun lt!193872 () array!25767)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25767 (_ BitVec 32)) Bool)

(assert (=> b!422861 (= res!247099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193872 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!422861 (= lt!193872 (array!25768 (store (arr!12333 _keys!709) i!563 k0!794) (size!12686 _keys!709)))))

(declare-fun b!422862 () Bool)

(declare-fun res!247109 () Bool)

(assert (=> b!422862 (=> (not res!247109) (not e!251438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422862 (= res!247109 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18075 () Bool)

(declare-fun mapRes!18075 () Bool)

(assert (=> mapIsEmpty!18075 mapRes!18075))

(declare-fun res!247103 () Bool)

(assert (=> start!39536 (=> (not res!247103) (not e!251438))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39536 (= res!247103 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12686 _keys!709))))))

(assert (=> start!39536 e!251438))

(assert (=> start!39536 tp_is_empty!10969))

(assert (=> start!39536 tp!34980))

(assert (=> start!39536 true))

(declare-datatypes ((V!15731 0))(
  ( (V!15732 (val!5529 Int)) )
))
(declare-datatypes ((ValueCell!5141 0))(
  ( (ValueCellFull!5141 (v!7770 V!15731)) (EmptyCell!5141) )
))
(declare-datatypes ((array!25769 0))(
  ( (array!25770 (arr!12334 (Array (_ BitVec 32) ValueCell!5141)) (size!12687 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25769)

(declare-fun e!251442 () Bool)

(declare-fun array_inv!9022 (array!25769) Bool)

(assert (=> start!39536 (and (array_inv!9022 _values!549) e!251442)))

(declare-fun array_inv!9023 (array!25767) Bool)

(assert (=> start!39536 (array_inv!9023 _keys!709)))

(declare-fun b!422863 () Bool)

(declare-fun res!247106 () Bool)

(assert (=> b!422863 (=> (not res!247106) (not e!251438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422863 (= res!247106 (validMask!0 mask!1025))))

(declare-fun b!422864 () Bool)

(assert (=> b!422864 (= e!251437 false)))

(declare-fun minValue!515 () V!15731)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7248 0))(
  ( (tuple2!7249 (_1!3635 (_ BitVec 64)) (_2!3635 V!15731)) )
))
(declare-datatypes ((List!7241 0))(
  ( (Nil!7238) (Cons!7237 (h!8093 tuple2!7248) (t!12676 List!7241)) )
))
(declare-datatypes ((ListLongMap!6151 0))(
  ( (ListLongMap!6152 (toList!3091 List!7241)) )
))
(declare-fun lt!193873 () ListLongMap!6151)

(declare-fun v!412 () V!15731)

(declare-fun zeroValue!515 () V!15731)

(declare-fun getCurrentListMapNoExtraKeys!1299 (array!25767 array!25769 (_ BitVec 32) (_ BitVec 32) V!15731 V!15731 (_ BitVec 32) Int) ListLongMap!6151)

(assert (=> b!422864 (= lt!193873 (getCurrentListMapNoExtraKeys!1299 lt!193872 (array!25770 (store (arr!12334 _values!549) i!563 (ValueCellFull!5141 v!412)) (size!12687 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193874 () ListLongMap!6151)

(assert (=> b!422864 (= lt!193874 (getCurrentListMapNoExtraKeys!1299 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422865 () Bool)

(declare-fun e!251440 () Bool)

(assert (=> b!422865 (= e!251440 tp_is_empty!10969)))

(declare-fun b!422866 () Bool)

(declare-fun res!247110 () Bool)

(assert (=> b!422866 (=> (not res!247110) (not e!251437))))

(declare-datatypes ((List!7242 0))(
  ( (Nil!7239) (Cons!7238 (h!8094 (_ BitVec 64)) (t!12677 List!7242)) )
))
(declare-fun arrayNoDuplicates!0 (array!25767 (_ BitVec 32) List!7242) Bool)

(assert (=> b!422866 (= res!247110 (arrayNoDuplicates!0 lt!193872 #b00000000000000000000000000000000 Nil!7239))))

(declare-fun b!422867 () Bool)

(declare-fun res!247101 () Bool)

(assert (=> b!422867 (=> (not res!247101) (not e!251437))))

(assert (=> b!422867 (= res!247101 (bvsle from!863 i!563))))

(declare-fun b!422868 () Bool)

(declare-fun res!247102 () Bool)

(assert (=> b!422868 (=> (not res!247102) (not e!251438))))

(assert (=> b!422868 (= res!247102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422869 () Bool)

(declare-fun res!247105 () Bool)

(assert (=> b!422869 (=> (not res!247105) (not e!251438))))

(declare-fun arrayContainsKey!0 (array!25767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422869 (= res!247105 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422870 () Bool)

(declare-fun res!247108 () Bool)

(assert (=> b!422870 (=> (not res!247108) (not e!251438))))

(assert (=> b!422870 (= res!247108 (and (= (size!12687 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12686 _keys!709) (size!12687 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18075 () Bool)

(declare-fun tp!34979 () Bool)

(assert (=> mapNonEmpty!18075 (= mapRes!18075 (and tp!34979 e!251439))))

(declare-fun mapKey!18075 () (_ BitVec 32))

(declare-fun mapRest!18075 () (Array (_ BitVec 32) ValueCell!5141))

(declare-fun mapValue!18075 () ValueCell!5141)

(assert (=> mapNonEmpty!18075 (= (arr!12334 _values!549) (store mapRest!18075 mapKey!18075 mapValue!18075))))

(declare-fun b!422871 () Bool)

(assert (=> b!422871 (= e!251442 (and e!251440 mapRes!18075))))

(declare-fun condMapEmpty!18075 () Bool)

(declare-fun mapDefault!18075 () ValueCell!5141)

(assert (=> b!422871 (= condMapEmpty!18075 (= (arr!12334 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5141)) mapDefault!18075)))))

(declare-fun b!422872 () Bool)

(declare-fun res!247107 () Bool)

(assert (=> b!422872 (=> (not res!247107) (not e!251438))))

(assert (=> b!422872 (= res!247107 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7239))))

(assert (= (and start!39536 res!247103) b!422863))

(assert (= (and b!422863 res!247106) b!422870))

(assert (= (and b!422870 res!247108) b!422868))

(assert (= (and b!422868 res!247102) b!422872))

(assert (= (and b!422872 res!247107) b!422860))

(assert (= (and b!422860 res!247100) b!422862))

(assert (= (and b!422862 res!247109) b!422859))

(assert (= (and b!422859 res!247104) b!422869))

(assert (= (and b!422869 res!247105) b!422861))

(assert (= (and b!422861 res!247099) b!422866))

(assert (= (and b!422866 res!247110) b!422867))

(assert (= (and b!422867 res!247101) b!422864))

(assert (= (and b!422871 condMapEmpty!18075) mapIsEmpty!18075))

(assert (= (and b!422871 (not condMapEmpty!18075)) mapNonEmpty!18075))

(get-info :version)

(assert (= (and mapNonEmpty!18075 ((_ is ValueCellFull!5141) mapValue!18075)) b!422858))

(assert (= (and b!422871 ((_ is ValueCellFull!5141) mapDefault!18075)) b!422865))

(assert (= start!39536 b!422871))

(declare-fun m!411981 () Bool)

(assert (=> b!422859 m!411981))

(declare-fun m!411983 () Bool)

(assert (=> mapNonEmpty!18075 m!411983))

(declare-fun m!411985 () Bool)

(assert (=> b!422872 m!411985))

(declare-fun m!411987 () Bool)

(assert (=> b!422868 m!411987))

(declare-fun m!411989 () Bool)

(assert (=> b!422861 m!411989))

(declare-fun m!411991 () Bool)

(assert (=> b!422861 m!411991))

(declare-fun m!411993 () Bool)

(assert (=> b!422866 m!411993))

(declare-fun m!411995 () Bool)

(assert (=> b!422863 m!411995))

(declare-fun m!411997 () Bool)

(assert (=> b!422864 m!411997))

(declare-fun m!411999 () Bool)

(assert (=> b!422864 m!411999))

(declare-fun m!412001 () Bool)

(assert (=> b!422864 m!412001))

(declare-fun m!412003 () Bool)

(assert (=> b!422869 m!412003))

(declare-fun m!412005 () Bool)

(assert (=> start!39536 m!412005))

(declare-fun m!412007 () Bool)

(assert (=> start!39536 m!412007))

(declare-fun m!412009 () Bool)

(assert (=> b!422862 m!412009))

(check-sat (not mapNonEmpty!18075) (not b!422864) (not b!422866) (not b!422862) (not b_next!9817) tp_is_empty!10969 (not b!422863) (not b!422872) b_and!17447 (not b!422861) (not b!422869) (not b!422868) (not start!39536))
(check-sat b_and!17447 (not b_next!9817))
