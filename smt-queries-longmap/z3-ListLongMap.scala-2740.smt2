; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40260 () Bool)

(assert start!40260)

(declare-fun b!441989 () Bool)

(declare-fun res!261755 () Bool)

(declare-fun e!260172 () Bool)

(assert (=> b!441989 (=> (not res!261755) (not e!260172))))

(declare-datatypes ((array!27169 0))(
  ( (array!27170 (arr!13034 (Array (_ BitVec 32) (_ BitVec 64))) (size!13386 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27169)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16677 0))(
  ( (V!16678 (val!5884 Int)) )
))
(declare-datatypes ((ValueCell!5496 0))(
  ( (ValueCellFull!5496 (v!8131 V!16677)) (EmptyCell!5496) )
))
(declare-datatypes ((array!27171 0))(
  ( (array!27172 (arr!13035 (Array (_ BitVec 32) ValueCell!5496)) (size!13387 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27171)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!441989 (= res!261755 (and (= (size!13387 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13386 _keys!709) (size!13387 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441990 () Bool)

(declare-fun res!261760 () Bool)

(assert (=> b!441990 (=> (not res!261760) (not e!260172))))

(declare-datatypes ((List!7827 0))(
  ( (Nil!7824) (Cons!7823 (h!8679 (_ BitVec 64)) (t!13583 List!7827)) )
))
(declare-fun arrayNoDuplicates!0 (array!27169 (_ BitVec 32) List!7827) Bool)

(assert (=> b!441990 (= res!261760 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7824))))

(declare-fun b!441991 () Bool)

(declare-fun e!260174 () Bool)

(assert (=> b!441991 (= e!260174 false)))

(declare-fun lt!203057 () Bool)

(declare-fun lt!203056 () array!27169)

(assert (=> b!441991 (= lt!203057 (arrayNoDuplicates!0 lt!203056 #b00000000000000000000000000000000 Nil!7824))))

(declare-fun b!441992 () Bool)

(declare-fun res!261762 () Bool)

(assert (=> b!441992 (=> (not res!261762) (not e!260172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441992 (= res!261762 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19140 () Bool)

(declare-fun mapRes!19140 () Bool)

(assert (=> mapIsEmpty!19140 mapRes!19140))

(declare-fun b!441993 () Bool)

(declare-fun res!261759 () Bool)

(assert (=> b!441993 (=> (not res!261759) (not e!260172))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441993 (= res!261759 (or (= (select (arr!13034 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13034 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!261754 () Bool)

(assert (=> start!40260 (=> (not res!261754) (not e!260172))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40260 (= res!261754 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13386 _keys!709))))))

(assert (=> start!40260 e!260172))

(assert (=> start!40260 true))

(declare-fun e!260175 () Bool)

(declare-fun array_inv!9460 (array!27171) Bool)

(assert (=> start!40260 (and (array_inv!9460 _values!549) e!260175)))

(declare-fun array_inv!9461 (array!27169) Bool)

(assert (=> start!40260 (array_inv!9461 _keys!709)))

(declare-fun b!441994 () Bool)

(assert (=> b!441994 (= e!260172 e!260174)))

(declare-fun res!261757 () Bool)

(assert (=> b!441994 (=> (not res!261757) (not e!260174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27169 (_ BitVec 32)) Bool)

(assert (=> b!441994 (= res!261757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203056 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!441994 (= lt!203056 (array!27170 (store (arr!13034 _keys!709) i!563 k0!794) (size!13386 _keys!709)))))

(declare-fun b!441995 () Bool)

(declare-fun res!261758 () Bool)

(assert (=> b!441995 (=> (not res!261758) (not e!260172))))

(declare-fun arrayContainsKey!0 (array!27169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441995 (= res!261758 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441996 () Bool)

(declare-fun res!261761 () Bool)

(assert (=> b!441996 (=> (not res!261761) (not e!260172))))

(assert (=> b!441996 (= res!261761 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13386 _keys!709))))))

(declare-fun b!441997 () Bool)

(declare-fun e!260173 () Bool)

(declare-fun tp_is_empty!11679 () Bool)

(assert (=> b!441997 (= e!260173 tp_is_empty!11679)))

(declare-fun mapNonEmpty!19140 () Bool)

(declare-fun tp!37104 () Bool)

(assert (=> mapNonEmpty!19140 (= mapRes!19140 (and tp!37104 e!260173))))

(declare-fun mapKey!19140 () (_ BitVec 32))

(declare-fun mapRest!19140 () (Array (_ BitVec 32) ValueCell!5496))

(declare-fun mapValue!19140 () ValueCell!5496)

(assert (=> mapNonEmpty!19140 (= (arr!13035 _values!549) (store mapRest!19140 mapKey!19140 mapValue!19140))))

(declare-fun b!441998 () Bool)

(declare-fun res!261756 () Bool)

(assert (=> b!441998 (=> (not res!261756) (not e!260172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441998 (= res!261756 (validKeyInArray!0 k0!794))))

(declare-fun b!441999 () Bool)

(declare-fun e!260170 () Bool)

(assert (=> b!441999 (= e!260170 tp_is_empty!11679)))

(declare-fun b!442000 () Bool)

(declare-fun res!261753 () Bool)

(assert (=> b!442000 (=> (not res!261753) (not e!260172))))

(assert (=> b!442000 (= res!261753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442001 () Bool)

(assert (=> b!442001 (= e!260175 (and e!260170 mapRes!19140))))

(declare-fun condMapEmpty!19140 () Bool)

(declare-fun mapDefault!19140 () ValueCell!5496)

(assert (=> b!442001 (= condMapEmpty!19140 (= (arr!13035 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5496)) mapDefault!19140)))))

(assert (= (and start!40260 res!261754) b!441992))

(assert (= (and b!441992 res!261762) b!441989))

(assert (= (and b!441989 res!261755) b!442000))

(assert (= (and b!442000 res!261753) b!441990))

(assert (= (and b!441990 res!261760) b!441996))

(assert (= (and b!441996 res!261761) b!441998))

(assert (= (and b!441998 res!261756) b!441993))

(assert (= (and b!441993 res!261759) b!441995))

(assert (= (and b!441995 res!261758) b!441994))

(assert (= (and b!441994 res!261757) b!441991))

(assert (= (and b!442001 condMapEmpty!19140) mapIsEmpty!19140))

(assert (= (and b!442001 (not condMapEmpty!19140)) mapNonEmpty!19140))

(get-info :version)

(assert (= (and mapNonEmpty!19140 ((_ is ValueCellFull!5496) mapValue!19140)) b!441997))

(assert (= (and b!442001 ((_ is ValueCellFull!5496) mapDefault!19140)) b!441999))

(assert (= start!40260 b!442001))

(declare-fun m!428709 () Bool)

(assert (=> b!441991 m!428709))

(declare-fun m!428711 () Bool)

(assert (=> b!441990 m!428711))

(declare-fun m!428713 () Bool)

(assert (=> start!40260 m!428713))

(declare-fun m!428715 () Bool)

(assert (=> start!40260 m!428715))

(declare-fun m!428717 () Bool)

(assert (=> mapNonEmpty!19140 m!428717))

(declare-fun m!428719 () Bool)

(assert (=> b!442000 m!428719))

(declare-fun m!428721 () Bool)

(assert (=> b!441993 m!428721))

(declare-fun m!428723 () Bool)

(assert (=> b!441998 m!428723))

(declare-fun m!428725 () Bool)

(assert (=> b!441994 m!428725))

(declare-fun m!428727 () Bool)

(assert (=> b!441994 m!428727))

(declare-fun m!428729 () Bool)

(assert (=> b!441992 m!428729))

(declare-fun m!428731 () Bool)

(assert (=> b!441995 m!428731))

(check-sat (not mapNonEmpty!19140) (not b!442000) (not b!441991) (not b!441990) (not b!441992) (not b!441995) (not b!441998) tp_is_empty!11679 (not start!40260) (not b!441994))
(check-sat)
