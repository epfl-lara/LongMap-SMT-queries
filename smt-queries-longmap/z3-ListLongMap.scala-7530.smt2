; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95720 () Bool)

(assert start!95720)

(declare-fun res!718994 () Bool)

(declare-fun e!617372 () Bool)

(assert (=> start!95720 (=> (not res!718994) (not e!617372))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95720 (= res!718994 (validMask!0 mask!1414))))

(assert (=> start!95720 e!617372))

(assert (=> start!95720 true))

(declare-datatypes ((array!69301 0))(
  ( (array!69302 (arr!33319 (Array (_ BitVec 32) (_ BitVec 64))) (size!33856 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69301)

(declare-fun array_inv!25776 (array!69301) Bool)

(assert (=> start!95720 (array_inv!25776 _keys!1070)))

(declare-datatypes ((V!40001 0))(
  ( (V!40002 (val!13134 Int)) )
))
(declare-datatypes ((ValueCell!12368 0))(
  ( (ValueCellFull!12368 (v!15751 V!40001)) (EmptyCell!12368) )
))
(declare-datatypes ((array!69303 0))(
  ( (array!69304 (arr!33320 (Array (_ BitVec 32) ValueCell!12368)) (size!33857 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69303)

(declare-fun e!617371 () Bool)

(declare-fun array_inv!25777 (array!69303) Bool)

(assert (=> start!95720 (and (array_inv!25777 _values!874) e!617371)))

(declare-fun b!1079580 () Bool)

(declare-fun e!617369 () Bool)

(declare-fun mapRes!40984 () Bool)

(assert (=> b!1079580 (= e!617371 (and e!617369 mapRes!40984))))

(declare-fun condMapEmpty!40984 () Bool)

(declare-fun mapDefault!40984 () ValueCell!12368)

(assert (=> b!1079580 (= condMapEmpty!40984 (= (arr!33320 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12368)) mapDefault!40984)))))

(declare-fun b!1079581 () Bool)

(declare-fun e!617370 () Bool)

(assert (=> b!1079581 (= e!617372 e!617370)))

(declare-fun res!718996 () Bool)

(assert (=> b!1079581 (=> (not res!718996) (not e!617370))))

(declare-fun lt!479118 () array!69301)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69301 (_ BitVec 32)) Bool)

(assert (=> b!1079581 (= res!718996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479118 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079581 (= lt!479118 (array!69302 (store (arr!33319 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33856 _keys!1070)))))

(declare-fun mapNonEmpty!40984 () Bool)

(declare-fun tp!78446 () Bool)

(declare-fun e!617374 () Bool)

(assert (=> mapNonEmpty!40984 (= mapRes!40984 (and tp!78446 e!617374))))

(declare-fun mapRest!40984 () (Array (_ BitVec 32) ValueCell!12368))

(declare-fun mapKey!40984 () (_ BitVec 32))

(declare-fun mapValue!40984 () ValueCell!12368)

(assert (=> mapNonEmpty!40984 (= (arr!33320 _values!874) (store mapRest!40984 mapKey!40984 mapValue!40984))))

(declare-fun b!1079582 () Bool)

(declare-fun res!718995 () Bool)

(assert (=> b!1079582 (=> (not res!718995) (not e!617372))))

(assert (=> b!1079582 (= res!718995 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33856 _keys!1070))))))

(declare-fun b!1079583 () Bool)

(declare-fun res!718998 () Bool)

(assert (=> b!1079583 (=> (not res!718998) (not e!617372))))

(assert (=> b!1079583 (= res!718998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!40984 () Bool)

(assert (=> mapIsEmpty!40984 mapRes!40984))

(declare-fun b!1079584 () Bool)

(declare-fun res!718997 () Bool)

(assert (=> b!1079584 (=> (not res!718997) (not e!617372))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079584 (= res!718997 (validKeyInArray!0 k0!904))))

(declare-fun b!1079585 () Bool)

(declare-fun tp_is_empty!26155 () Bool)

(assert (=> b!1079585 (= e!617374 tp_is_empty!26155)))

(declare-fun b!1079586 () Bool)

(declare-fun res!718993 () Bool)

(assert (=> b!1079586 (=> (not res!718993) (not e!617372))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079586 (= res!718993 (and (= (size!33857 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33856 _keys!1070) (size!33857 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079587 () Bool)

(assert (=> b!1079587 (= e!617370 false)))

(declare-fun lt!479117 () Bool)

(declare-datatypes ((List!23243 0))(
  ( (Nil!23240) (Cons!23239 (h!24457 (_ BitVec 64)) (t!32594 List!23243)) )
))
(declare-fun arrayNoDuplicates!0 (array!69301 (_ BitVec 32) List!23243) Bool)

(assert (=> b!1079587 (= lt!479117 (arrayNoDuplicates!0 lt!479118 #b00000000000000000000000000000000 Nil!23240))))

(declare-fun b!1079588 () Bool)

(declare-fun res!718999 () Bool)

(assert (=> b!1079588 (=> (not res!718999) (not e!617372))))

(assert (=> b!1079588 (= res!718999 (= (select (arr!33319 _keys!1070) i!650) k0!904))))

(declare-fun b!1079589 () Bool)

(assert (=> b!1079589 (= e!617369 tp_is_empty!26155)))

(declare-fun b!1079590 () Bool)

(declare-fun res!718992 () Bool)

(assert (=> b!1079590 (=> (not res!718992) (not e!617372))))

(assert (=> b!1079590 (= res!718992 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23240))))

(assert (= (and start!95720 res!718994) b!1079586))

(assert (= (and b!1079586 res!718993) b!1079583))

(assert (= (and b!1079583 res!718998) b!1079590))

(assert (= (and b!1079590 res!718992) b!1079582))

(assert (= (and b!1079582 res!718995) b!1079584))

(assert (= (and b!1079584 res!718997) b!1079588))

(assert (= (and b!1079588 res!718999) b!1079581))

(assert (= (and b!1079581 res!718996) b!1079587))

(assert (= (and b!1079580 condMapEmpty!40984) mapIsEmpty!40984))

(assert (= (and b!1079580 (not condMapEmpty!40984)) mapNonEmpty!40984))

(get-info :version)

(assert (= (and mapNonEmpty!40984 ((_ is ValueCellFull!12368) mapValue!40984)) b!1079585))

(assert (= (and b!1079580 ((_ is ValueCellFull!12368) mapDefault!40984)) b!1079589))

(assert (= start!95720 b!1079580))

(declare-fun m!998487 () Bool)

(assert (=> start!95720 m!998487))

(declare-fun m!998489 () Bool)

(assert (=> start!95720 m!998489))

(declare-fun m!998491 () Bool)

(assert (=> start!95720 m!998491))

(declare-fun m!998493 () Bool)

(assert (=> b!1079587 m!998493))

(declare-fun m!998495 () Bool)

(assert (=> b!1079590 m!998495))

(declare-fun m!998497 () Bool)

(assert (=> mapNonEmpty!40984 m!998497))

(declare-fun m!998499 () Bool)

(assert (=> b!1079583 m!998499))

(declare-fun m!998501 () Bool)

(assert (=> b!1079581 m!998501))

(declare-fun m!998503 () Bool)

(assert (=> b!1079581 m!998503))

(declare-fun m!998505 () Bool)

(assert (=> b!1079588 m!998505))

(declare-fun m!998507 () Bool)

(assert (=> b!1079584 m!998507))

(check-sat (not mapNonEmpty!40984) (not b!1079581) tp_is_empty!26155 (not b!1079590) (not b!1079583) (not b!1079587) (not b!1079584) (not start!95720))
(check-sat)
