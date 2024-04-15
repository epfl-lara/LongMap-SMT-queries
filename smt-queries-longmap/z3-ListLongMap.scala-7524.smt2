; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95400 () Bool)

(assert start!95400)

(declare-fun b!1077386 () Bool)

(declare-fun res!717915 () Bool)

(declare-fun e!616034 () Bool)

(assert (=> b!1077386 (=> (not res!717915) (not e!616034))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69120 0))(
  ( (array!69121 (arr!33238 (Array (_ BitVec 32) (_ BitVec 64))) (size!33776 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69120)

(declare-datatypes ((V!39953 0))(
  ( (V!39954 (val!13116 Int)) )
))
(declare-datatypes ((ValueCell!12350 0))(
  ( (ValueCellFull!12350 (v!15735 V!39953)) (EmptyCell!12350) )
))
(declare-datatypes ((array!69122 0))(
  ( (array!69123 (arr!33239 (Array (_ BitVec 32) ValueCell!12350)) (size!33777 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69122)

(assert (=> b!1077386 (= res!717915 (and (= (size!33777 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33776 _keys!1070) (size!33777 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077387 () Bool)

(declare-fun e!616030 () Bool)

(declare-fun e!616032 () Bool)

(declare-fun mapRes!40921 () Bool)

(assert (=> b!1077387 (= e!616030 (and e!616032 mapRes!40921))))

(declare-fun condMapEmpty!40921 () Bool)

(declare-fun mapDefault!40921 () ValueCell!12350)

(assert (=> b!1077387 (= condMapEmpty!40921 (= (arr!33239 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12350)) mapDefault!40921)))))

(declare-fun res!717917 () Bool)

(assert (=> start!95400 (=> (not res!717917) (not e!616034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95400 (= res!717917 (validMask!0 mask!1414))))

(assert (=> start!95400 e!616034))

(assert (=> start!95400 true))

(declare-fun array_inv!25706 (array!69122) Bool)

(assert (=> start!95400 (and (array_inv!25706 _values!874) e!616030)))

(declare-fun array_inv!25707 (array!69120) Bool)

(assert (=> start!95400 (array_inv!25707 _keys!1070)))

(declare-fun b!1077388 () Bool)

(assert (=> b!1077388 (= e!616034 false)))

(declare-fun lt!478351 () Bool)

(declare-datatypes ((List!23272 0))(
  ( (Nil!23269) (Cons!23268 (h!24477 (_ BitVec 64)) (t!32622 List!23272)) )
))
(declare-fun arrayNoDuplicates!0 (array!69120 (_ BitVec 32) List!23272) Bool)

(assert (=> b!1077388 (= lt!478351 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23269))))

(declare-fun mapNonEmpty!40921 () Bool)

(declare-fun tp!78383 () Bool)

(declare-fun e!616031 () Bool)

(assert (=> mapNonEmpty!40921 (= mapRes!40921 (and tp!78383 e!616031))))

(declare-fun mapValue!40921 () ValueCell!12350)

(declare-fun mapKey!40921 () (_ BitVec 32))

(declare-fun mapRest!40921 () (Array (_ BitVec 32) ValueCell!12350))

(assert (=> mapNonEmpty!40921 (= (arr!33239 _values!874) (store mapRest!40921 mapKey!40921 mapValue!40921))))

(declare-fun mapIsEmpty!40921 () Bool)

(assert (=> mapIsEmpty!40921 mapRes!40921))

(declare-fun b!1077389 () Bool)

(declare-fun tp_is_empty!26119 () Bool)

(assert (=> b!1077389 (= e!616032 tp_is_empty!26119)))

(declare-fun b!1077390 () Bool)

(declare-fun res!717916 () Bool)

(assert (=> b!1077390 (=> (not res!717916) (not e!616034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69120 (_ BitVec 32)) Bool)

(assert (=> b!1077390 (= res!717916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077391 () Bool)

(assert (=> b!1077391 (= e!616031 tp_is_empty!26119)))

(assert (= (and start!95400 res!717917) b!1077386))

(assert (= (and b!1077386 res!717915) b!1077390))

(assert (= (and b!1077390 res!717916) b!1077388))

(assert (= (and b!1077387 condMapEmpty!40921) mapIsEmpty!40921))

(assert (= (and b!1077387 (not condMapEmpty!40921)) mapNonEmpty!40921))

(get-info :version)

(assert (= (and mapNonEmpty!40921 ((_ is ValueCellFull!12350) mapValue!40921)) b!1077391))

(assert (= (and b!1077387 ((_ is ValueCellFull!12350) mapDefault!40921)) b!1077389))

(assert (= start!95400 b!1077387))

(declare-fun m!995733 () Bool)

(assert (=> start!95400 m!995733))

(declare-fun m!995735 () Bool)

(assert (=> start!95400 m!995735))

(declare-fun m!995737 () Bool)

(assert (=> start!95400 m!995737))

(declare-fun m!995739 () Bool)

(assert (=> b!1077388 m!995739))

(declare-fun m!995741 () Bool)

(assert (=> mapNonEmpty!40921 m!995741))

(declare-fun m!995743 () Bool)

(assert (=> b!1077390 m!995743))

(check-sat (not mapNonEmpty!40921) tp_is_empty!26119 (not b!1077388) (not start!95400) (not b!1077390))
(check-sat)
