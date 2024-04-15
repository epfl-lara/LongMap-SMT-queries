; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40350 () Bool)

(assert start!40350)

(declare-fun mapIsEmpty!19251 () Bool)

(declare-fun mapRes!19251 () Bool)

(assert (=> mapIsEmpty!19251 mapRes!19251))

(declare-fun b!443173 () Bool)

(declare-fun e!260744 () Bool)

(assert (=> b!443173 (= e!260744 false)))

(declare-fun lt!203105 () Bool)

(declare-datatypes ((array!27311 0))(
  ( (array!27312 (arr!13103 (Array (_ BitVec 32) (_ BitVec 64))) (size!13456 (_ BitVec 32))) )
))
(declare-fun lt!203104 () array!27311)

(declare-datatypes ((List!7857 0))(
  ( (Nil!7854) (Cons!7853 (h!8709 (_ BitVec 64)) (t!13606 List!7857)) )
))
(declare-fun arrayNoDuplicates!0 (array!27311 (_ BitVec 32) List!7857) Bool)

(assert (=> b!443173 (= lt!203105 (arrayNoDuplicates!0 lt!203104 #b00000000000000000000000000000000 Nil!7854))))

(declare-fun b!443174 () Bool)

(declare-fun res!262650 () Bool)

(declare-fun e!260740 () Bool)

(assert (=> b!443174 (=> (not res!262650) (not e!260740))))

(declare-fun _keys!709 () array!27311)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27311 (_ BitVec 32)) Bool)

(assert (=> b!443174 (= res!262650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443175 () Bool)

(declare-fun res!262646 () Bool)

(assert (=> b!443175 (=> (not res!262646) (not e!260740))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443175 (= res!262646 (or (= (select (arr!13103 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13103 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443176 () Bool)

(declare-fun res!262651 () Bool)

(assert (=> b!443176 (=> (not res!262651) (not e!260740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443176 (= res!262651 (validMask!0 mask!1025))))

(declare-fun b!443177 () Bool)

(declare-fun res!262645 () Bool)

(assert (=> b!443177 (=> (not res!262645) (not e!260740))))

(assert (=> b!443177 (= res!262645 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13456 _keys!709))))))

(declare-fun b!443178 () Bool)

(declare-fun e!260739 () Bool)

(declare-fun e!260741 () Bool)

(assert (=> b!443178 (= e!260739 (and e!260741 mapRes!19251))))

(declare-fun condMapEmpty!19251 () Bool)

(declare-datatypes ((V!16771 0))(
  ( (V!16772 (val!5919 Int)) )
))
(declare-datatypes ((ValueCell!5531 0))(
  ( (ValueCellFull!5531 (v!8164 V!16771)) (EmptyCell!5531) )
))
(declare-datatypes ((array!27313 0))(
  ( (array!27314 (arr!13104 (Array (_ BitVec 32) ValueCell!5531)) (size!13457 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27313)

(declare-fun mapDefault!19251 () ValueCell!5531)

(assert (=> b!443178 (= condMapEmpty!19251 (= (arr!13104 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5531)) mapDefault!19251)))))

(declare-fun b!443179 () Bool)

(declare-fun e!260743 () Bool)

(declare-fun tp_is_empty!11749 () Bool)

(assert (=> b!443179 (= e!260743 tp_is_empty!11749)))

(declare-fun mapNonEmpty!19251 () Bool)

(declare-fun tp!37233 () Bool)

(assert (=> mapNonEmpty!19251 (= mapRes!19251 (and tp!37233 e!260743))))

(declare-fun mapValue!19251 () ValueCell!5531)

(declare-fun mapRest!19251 () (Array (_ BitVec 32) ValueCell!5531))

(declare-fun mapKey!19251 () (_ BitVec 32))

(assert (=> mapNonEmpty!19251 (= (arr!13104 _values!549) (store mapRest!19251 mapKey!19251 mapValue!19251))))

(declare-fun res!262644 () Bool)

(assert (=> start!40350 (=> (not res!262644) (not e!260740))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40350 (= res!262644 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13456 _keys!709))))))

(assert (=> start!40350 e!260740))

(assert (=> start!40350 true))

(declare-fun array_inv!9556 (array!27313) Bool)

(assert (=> start!40350 (and (array_inv!9556 _values!549) e!260739)))

(declare-fun array_inv!9557 (array!27311) Bool)

(assert (=> start!40350 (array_inv!9557 _keys!709)))

(declare-fun b!443180 () Bool)

(assert (=> b!443180 (= e!260741 tp_is_empty!11749)))

(declare-fun b!443181 () Bool)

(declare-fun res!262642 () Bool)

(assert (=> b!443181 (=> (not res!262642) (not e!260740))))

(assert (=> b!443181 (= res!262642 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7854))))

(declare-fun b!443182 () Bool)

(declare-fun res!262647 () Bool)

(assert (=> b!443182 (=> (not res!262647) (not e!260740))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443182 (= res!262647 (and (= (size!13457 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13456 _keys!709) (size!13457 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443183 () Bool)

(declare-fun res!262643 () Bool)

(assert (=> b!443183 (=> (not res!262643) (not e!260740))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443183 (= res!262643 (validKeyInArray!0 k0!794))))

(declare-fun b!443184 () Bool)

(assert (=> b!443184 (= e!260740 e!260744)))

(declare-fun res!262648 () Bool)

(assert (=> b!443184 (=> (not res!262648) (not e!260744))))

(assert (=> b!443184 (= res!262648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203104 mask!1025))))

(assert (=> b!443184 (= lt!203104 (array!27312 (store (arr!13103 _keys!709) i!563 k0!794) (size!13456 _keys!709)))))

(declare-fun b!443185 () Bool)

(declare-fun res!262649 () Bool)

(assert (=> b!443185 (=> (not res!262649) (not e!260740))))

(declare-fun arrayContainsKey!0 (array!27311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443185 (= res!262649 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40350 res!262644) b!443176))

(assert (= (and b!443176 res!262651) b!443182))

(assert (= (and b!443182 res!262647) b!443174))

(assert (= (and b!443174 res!262650) b!443181))

(assert (= (and b!443181 res!262642) b!443177))

(assert (= (and b!443177 res!262645) b!443183))

(assert (= (and b!443183 res!262643) b!443175))

(assert (= (and b!443175 res!262646) b!443185))

(assert (= (and b!443185 res!262649) b!443184))

(assert (= (and b!443184 res!262648) b!443173))

(assert (= (and b!443178 condMapEmpty!19251) mapIsEmpty!19251))

(assert (= (and b!443178 (not condMapEmpty!19251)) mapNonEmpty!19251))

(get-info :version)

(assert (= (and mapNonEmpty!19251 ((_ is ValueCellFull!5531) mapValue!19251)) b!443179))

(assert (= (and b!443178 ((_ is ValueCellFull!5531) mapDefault!19251)) b!443180))

(assert (= start!40350 b!443178))

(declare-fun m!428977 () Bool)

(assert (=> b!443173 m!428977))

(declare-fun m!428979 () Bool)

(assert (=> b!443183 m!428979))

(declare-fun m!428981 () Bool)

(assert (=> start!40350 m!428981))

(declare-fun m!428983 () Bool)

(assert (=> start!40350 m!428983))

(declare-fun m!428985 () Bool)

(assert (=> b!443175 m!428985))

(declare-fun m!428987 () Bool)

(assert (=> b!443176 m!428987))

(declare-fun m!428989 () Bool)

(assert (=> b!443174 m!428989))

(declare-fun m!428991 () Bool)

(assert (=> b!443181 m!428991))

(declare-fun m!428993 () Bool)

(assert (=> b!443184 m!428993))

(declare-fun m!428995 () Bool)

(assert (=> b!443184 m!428995))

(declare-fun m!428997 () Bool)

(assert (=> b!443185 m!428997))

(declare-fun m!428999 () Bool)

(assert (=> mapNonEmpty!19251 m!428999))

(check-sat (not b!443181) (not start!40350) tp_is_empty!11749 (not b!443173) (not b!443176) (not b!443184) (not mapNonEmpty!19251) (not b!443183) (not b!443174) (not b!443185))
(check-sat)
