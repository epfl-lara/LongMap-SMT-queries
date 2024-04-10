; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95504 () Bool)

(assert start!95504)

(declare-fun b!1078583 () Bool)

(declare-fun e!616697 () Bool)

(declare-fun tp_is_empty!26175 () Bool)

(assert (=> b!1078583 (= e!616697 tp_is_empty!26175)))

(declare-fun b!1078585 () Bool)

(declare-fun res!718710 () Bool)

(declare-fun e!616694 () Bool)

(assert (=> b!1078585 (=> (not res!718710) (not e!616694))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078585 (= res!718710 (validKeyInArray!0 k0!904))))

(declare-fun b!1078586 () Bool)

(declare-fun res!718712 () Bool)

(assert (=> b!1078586 (=> (not res!718712) (not e!616694))))

(declare-datatypes ((array!69305 0))(
  ( (array!69306 (arr!33327 (Array (_ BitVec 32) (_ BitVec 64))) (size!33863 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69305)

(declare-datatypes ((List!23243 0))(
  ( (Nil!23240) (Cons!23239 (h!24448 (_ BitVec 64)) (t!32602 List!23243)) )
))
(declare-fun arrayNoDuplicates!0 (array!69305 (_ BitVec 32) List!23243) Bool)

(assert (=> b!1078586 (= res!718712 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23240))))

(declare-fun b!1078587 () Bool)

(declare-fun res!718716 () Bool)

(assert (=> b!1078587 (=> (not res!718716) (not e!616694))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40027 0))(
  ( (V!40028 (val!13144 Int)) )
))
(declare-datatypes ((ValueCell!12378 0))(
  ( (ValueCellFull!12378 (v!15765 V!40027)) (EmptyCell!12378) )
))
(declare-datatypes ((array!69307 0))(
  ( (array!69308 (arr!33328 (Array (_ BitVec 32) ValueCell!12378)) (size!33864 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69307)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1078587 (= res!718716 (and (= (size!33864 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33863 _keys!1070) (size!33864 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078588 () Bool)

(declare-fun e!616699 () Bool)

(assert (=> b!1078588 (= e!616699 tp_is_empty!26175)))

(declare-fun res!718713 () Bool)

(assert (=> start!95504 (=> (not res!718713) (not e!616694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95504 (= res!718713 (validMask!0 mask!1414))))

(assert (=> start!95504 e!616694))

(assert (=> start!95504 true))

(declare-fun array_inv!25744 (array!69305) Bool)

(assert (=> start!95504 (array_inv!25744 _keys!1070)))

(declare-fun e!616696 () Bool)

(declare-fun array_inv!25745 (array!69307) Bool)

(assert (=> start!95504 (and (array_inv!25745 _values!874) e!616696)))

(declare-fun b!1078584 () Bool)

(declare-fun e!616695 () Bool)

(assert (=> b!1078584 (= e!616694 e!616695)))

(declare-fun res!718717 () Bool)

(assert (=> b!1078584 (=> (not res!718717) (not e!616695))))

(declare-fun lt!478663 () array!69305)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69305 (_ BitVec 32)) Bool)

(assert (=> b!1078584 (= res!718717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478663 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078584 (= lt!478663 (array!69306 (store (arr!33327 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33863 _keys!1070)))))

(declare-fun b!1078589 () Bool)

(declare-fun res!718715 () Bool)

(assert (=> b!1078589 (=> (not res!718715) (not e!616694))))

(assert (=> b!1078589 (= res!718715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078590 () Bool)

(declare-fun res!718714 () Bool)

(assert (=> b!1078590 (=> (not res!718714) (not e!616694))))

(assert (=> b!1078590 (= res!718714 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33863 _keys!1070))))))

(declare-fun mapIsEmpty!41014 () Bool)

(declare-fun mapRes!41014 () Bool)

(assert (=> mapIsEmpty!41014 mapRes!41014))

(declare-fun b!1078591 () Bool)

(assert (=> b!1078591 (= e!616696 (and e!616697 mapRes!41014))))

(declare-fun condMapEmpty!41014 () Bool)

(declare-fun mapDefault!41014 () ValueCell!12378)

(assert (=> b!1078591 (= condMapEmpty!41014 (= (arr!33328 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12378)) mapDefault!41014)))))

(declare-fun mapNonEmpty!41014 () Bool)

(declare-fun tp!78476 () Bool)

(assert (=> mapNonEmpty!41014 (= mapRes!41014 (and tp!78476 e!616699))))

(declare-fun mapValue!41014 () ValueCell!12378)

(declare-fun mapRest!41014 () (Array (_ BitVec 32) ValueCell!12378))

(declare-fun mapKey!41014 () (_ BitVec 32))

(assert (=> mapNonEmpty!41014 (= (arr!33328 _values!874) (store mapRest!41014 mapKey!41014 mapValue!41014))))

(declare-fun b!1078592 () Bool)

(declare-fun res!718711 () Bool)

(assert (=> b!1078592 (=> (not res!718711) (not e!616694))))

(assert (=> b!1078592 (= res!718711 (= (select (arr!33327 _keys!1070) i!650) k0!904))))

(declare-fun b!1078593 () Bool)

(assert (=> b!1078593 (= e!616695 false)))

(declare-fun lt!478662 () Bool)

(assert (=> b!1078593 (= lt!478662 (arrayNoDuplicates!0 lt!478663 #b00000000000000000000000000000000 Nil!23240))))

(assert (= (and start!95504 res!718713) b!1078587))

(assert (= (and b!1078587 res!718716) b!1078589))

(assert (= (and b!1078589 res!718715) b!1078586))

(assert (= (and b!1078586 res!718712) b!1078590))

(assert (= (and b!1078590 res!718714) b!1078585))

(assert (= (and b!1078585 res!718710) b!1078592))

(assert (= (and b!1078592 res!718711) b!1078584))

(assert (= (and b!1078584 res!718717) b!1078593))

(assert (= (and b!1078591 condMapEmpty!41014) mapIsEmpty!41014))

(assert (= (and b!1078591 (not condMapEmpty!41014)) mapNonEmpty!41014))

(get-info :version)

(assert (= (and mapNonEmpty!41014 ((_ is ValueCellFull!12378) mapValue!41014)) b!1078588))

(assert (= (and b!1078591 ((_ is ValueCellFull!12378) mapDefault!41014)) b!1078583))

(assert (= start!95504 b!1078591))

(declare-fun m!997035 () Bool)

(assert (=> mapNonEmpty!41014 m!997035))

(declare-fun m!997037 () Bool)

(assert (=> b!1078585 m!997037))

(declare-fun m!997039 () Bool)

(assert (=> start!95504 m!997039))

(declare-fun m!997041 () Bool)

(assert (=> start!95504 m!997041))

(declare-fun m!997043 () Bool)

(assert (=> start!95504 m!997043))

(declare-fun m!997045 () Bool)

(assert (=> b!1078592 m!997045))

(declare-fun m!997047 () Bool)

(assert (=> b!1078586 m!997047))

(declare-fun m!997049 () Bool)

(assert (=> b!1078589 m!997049))

(declare-fun m!997051 () Bool)

(assert (=> b!1078593 m!997051))

(declare-fun m!997053 () Bool)

(assert (=> b!1078584 m!997053))

(declare-fun m!997055 () Bool)

(assert (=> b!1078584 m!997055))

(check-sat (not b!1078593) (not b!1078585) (not b!1078589) (not mapNonEmpty!41014) (not b!1078584) (not start!95504) (not b!1078586) tp_is_empty!26175)
(check-sat)
