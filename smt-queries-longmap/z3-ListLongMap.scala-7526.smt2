; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95412 () Bool)

(assert start!95412)

(declare-fun b!1077532 () Bool)

(declare-fun e!616123 () Bool)

(declare-fun e!616122 () Bool)

(declare-fun mapRes!40939 () Bool)

(assert (=> b!1077532 (= e!616123 (and e!616122 mapRes!40939))))

(declare-fun condMapEmpty!40939 () Bool)

(declare-datatypes ((V!39969 0))(
  ( (V!39970 (val!13122 Int)) )
))
(declare-datatypes ((ValueCell!12356 0))(
  ( (ValueCellFull!12356 (v!15741 V!39969)) (EmptyCell!12356) )
))
(declare-datatypes ((array!69144 0))(
  ( (array!69145 (arr!33250 (Array (_ BitVec 32) ValueCell!12356)) (size!33788 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69144)

(declare-fun mapDefault!40939 () ValueCell!12356)

(assert (=> b!1077532 (= condMapEmpty!40939 (= (arr!33250 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12356)) mapDefault!40939)))))

(declare-fun b!1077533 () Bool)

(declare-fun res!718009 () Bool)

(declare-fun e!616121 () Bool)

(assert (=> b!1077533 (=> (not res!718009) (not e!616121))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077533 (= res!718009 (validKeyInArray!0 k0!904))))

(declare-fun b!1077534 () Bool)

(declare-datatypes ((array!69146 0))(
  ( (array!69147 (arr!33251 (Array (_ BitVec 32) (_ BitVec 64))) (size!33789 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69146)

(assert (=> b!1077534 (= e!616121 (bvsgt #b00000000000000000000000000000000 (size!33789 _keys!1070)))))

(declare-fun b!1077535 () Bool)

(declare-fun res!718006 () Bool)

(assert (=> b!1077535 (=> (not res!718006) (not e!616121))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077535 (= res!718006 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33789 _keys!1070))))))

(declare-fun mapNonEmpty!40939 () Bool)

(declare-fun tp!78401 () Bool)

(declare-fun e!616124 () Bool)

(assert (=> mapNonEmpty!40939 (= mapRes!40939 (and tp!78401 e!616124))))

(declare-fun mapKey!40939 () (_ BitVec 32))

(declare-fun mapRest!40939 () (Array (_ BitVec 32) ValueCell!12356))

(declare-fun mapValue!40939 () ValueCell!12356)

(assert (=> mapNonEmpty!40939 (= (arr!33250 _values!874) (store mapRest!40939 mapKey!40939 mapValue!40939))))

(declare-fun b!1077536 () Bool)

(declare-fun res!718012 () Bool)

(assert (=> b!1077536 (=> (not res!718012) (not e!616121))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69146 (_ BitVec 32)) Bool)

(assert (=> b!1077536 (= res!718012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69147 (store (arr!33251 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33789 _keys!1070)) mask!1414))))

(declare-fun b!1077537 () Bool)

(declare-fun res!718010 () Bool)

(assert (=> b!1077537 (=> (not res!718010) (not e!616121))))

(assert (=> b!1077537 (= res!718010 (= (select (arr!33251 _keys!1070) i!650) k0!904))))

(declare-fun b!1077538 () Bool)

(declare-fun tp_is_empty!26131 () Bool)

(assert (=> b!1077538 (= e!616122 tp_is_empty!26131)))

(declare-fun b!1077539 () Bool)

(declare-fun res!718008 () Bool)

(assert (=> b!1077539 (=> (not res!718008) (not e!616121))))

(assert (=> b!1077539 (= res!718008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!40939 () Bool)

(assert (=> mapIsEmpty!40939 mapRes!40939))

(declare-fun b!1077531 () Bool)

(assert (=> b!1077531 (= e!616124 tp_is_empty!26131)))

(declare-fun res!718013 () Bool)

(assert (=> start!95412 (=> (not res!718013) (not e!616121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95412 (= res!718013 (validMask!0 mask!1414))))

(assert (=> start!95412 e!616121))

(assert (=> start!95412 true))

(declare-fun array_inv!25714 (array!69146) Bool)

(assert (=> start!95412 (array_inv!25714 _keys!1070)))

(declare-fun array_inv!25715 (array!69144) Bool)

(assert (=> start!95412 (and (array_inv!25715 _values!874) e!616123)))

(declare-fun b!1077540 () Bool)

(declare-fun res!718007 () Bool)

(assert (=> b!1077540 (=> (not res!718007) (not e!616121))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077540 (= res!718007 (and (= (size!33788 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33789 _keys!1070) (size!33788 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077541 () Bool)

(declare-fun res!718011 () Bool)

(assert (=> b!1077541 (=> (not res!718011) (not e!616121))))

(declare-datatypes ((List!23277 0))(
  ( (Nil!23274) (Cons!23273 (h!24482 (_ BitVec 64)) (t!32627 List!23277)) )
))
(declare-fun arrayNoDuplicates!0 (array!69146 (_ BitVec 32) List!23277) Bool)

(assert (=> b!1077541 (= res!718011 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23274))))

(assert (= (and start!95412 res!718013) b!1077540))

(assert (= (and b!1077540 res!718007) b!1077539))

(assert (= (and b!1077539 res!718008) b!1077541))

(assert (= (and b!1077541 res!718011) b!1077535))

(assert (= (and b!1077535 res!718006) b!1077533))

(assert (= (and b!1077533 res!718009) b!1077537))

(assert (= (and b!1077537 res!718010) b!1077536))

(assert (= (and b!1077536 res!718012) b!1077534))

(assert (= (and b!1077532 condMapEmpty!40939) mapIsEmpty!40939))

(assert (= (and b!1077532 (not condMapEmpty!40939)) mapNonEmpty!40939))

(get-info :version)

(assert (= (and mapNonEmpty!40939 ((_ is ValueCellFull!12356) mapValue!40939)) b!1077531))

(assert (= (and b!1077532 ((_ is ValueCellFull!12356) mapDefault!40939)) b!1077538))

(assert (= start!95412 b!1077532))

(declare-fun m!995817 () Bool)

(assert (=> b!1077541 m!995817))

(declare-fun m!995819 () Bool)

(assert (=> mapNonEmpty!40939 m!995819))

(declare-fun m!995821 () Bool)

(assert (=> b!1077539 m!995821))

(declare-fun m!995823 () Bool)

(assert (=> b!1077533 m!995823))

(declare-fun m!995825 () Bool)

(assert (=> start!95412 m!995825))

(declare-fun m!995827 () Bool)

(assert (=> start!95412 m!995827))

(declare-fun m!995829 () Bool)

(assert (=> start!95412 m!995829))

(declare-fun m!995831 () Bool)

(assert (=> b!1077537 m!995831))

(declare-fun m!995833 () Bool)

(assert (=> b!1077536 m!995833))

(declare-fun m!995835 () Bool)

(assert (=> b!1077536 m!995835))

(check-sat (not b!1077541) tp_is_empty!26131 (not b!1077533) (not b!1077539) (not b!1077536) (not start!95412) (not mapNonEmpty!40939))
(check-sat)
