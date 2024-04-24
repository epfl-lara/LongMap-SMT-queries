; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95642 () Bool)

(assert start!95642)

(declare-fun mapNonEmpty!40921 () Bool)

(declare-fun mapRes!40921 () Bool)

(declare-fun tp!78383 () Bool)

(declare-fun e!616982 () Bool)

(assert (=> mapNonEmpty!40921 (= mapRes!40921 (and tp!78383 e!616982))))

(declare-datatypes ((V!39953 0))(
  ( (V!39954 (val!13116 Int)) )
))
(declare-datatypes ((ValueCell!12350 0))(
  ( (ValueCellFull!12350 (v!15732 V!39953)) (EmptyCell!12350) )
))
(declare-fun mapValue!40921 () ValueCell!12350)

(declare-fun mapKey!40921 () (_ BitVec 32))

(declare-datatypes ((array!69227 0))(
  ( (array!69228 (arr!33285 (Array (_ BitVec 32) ValueCell!12350)) (size!33822 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69227)

(declare-fun mapRest!40921 () (Array (_ BitVec 32) ValueCell!12350))

(assert (=> mapNonEmpty!40921 (= (arr!33285 _values!874) (store mapRest!40921 mapKey!40921 mapValue!40921))))

(declare-fun b!1078866 () Bool)

(declare-fun e!616981 () Bool)

(assert (=> b!1078866 (= e!616981 false)))

(declare-fun lt!479066 () Bool)

(declare-datatypes ((array!69229 0))(
  ( (array!69230 (arr!33286 (Array (_ BitVec 32) (_ BitVec 64))) (size!33823 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69229)

(declare-datatypes ((List!23233 0))(
  ( (Nil!23230) (Cons!23229 (h!24447 (_ BitVec 64)) (t!32584 List!23233)) )
))
(declare-fun arrayNoDuplicates!0 (array!69229 (_ BitVec 32) List!23233) Bool)

(assert (=> b!1078866 (= lt!479066 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23230))))

(declare-fun b!1078867 () Bool)

(declare-fun e!616979 () Bool)

(declare-fun e!616978 () Bool)

(assert (=> b!1078867 (= e!616979 (and e!616978 mapRes!40921))))

(declare-fun condMapEmpty!40921 () Bool)

(declare-fun mapDefault!40921 () ValueCell!12350)

(assert (=> b!1078867 (= condMapEmpty!40921 (= (arr!33285 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12350)) mapDefault!40921)))))

(declare-fun mapIsEmpty!40921 () Bool)

(assert (=> mapIsEmpty!40921 mapRes!40921))

(declare-fun b!1078869 () Bool)

(declare-fun res!718508 () Bool)

(assert (=> b!1078869 (=> (not res!718508) (not e!616981))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078869 (= res!718508 (and (= (size!33822 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33823 _keys!1070) (size!33822 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078870 () Bool)

(declare-fun tp_is_empty!26119 () Bool)

(assert (=> b!1078870 (= e!616982 tp_is_empty!26119)))

(declare-fun b!1078871 () Bool)

(assert (=> b!1078871 (= e!616978 tp_is_empty!26119)))

(declare-fun b!1078868 () Bool)

(declare-fun res!718506 () Bool)

(assert (=> b!1078868 (=> (not res!718506) (not e!616981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69229 (_ BitVec 32)) Bool)

(assert (=> b!1078868 (= res!718506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!718507 () Bool)

(assert (=> start!95642 (=> (not res!718507) (not e!616981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95642 (= res!718507 (validMask!0 mask!1414))))

(assert (=> start!95642 e!616981))

(assert (=> start!95642 true))

(declare-fun array_inv!25754 (array!69227) Bool)

(assert (=> start!95642 (and (array_inv!25754 _values!874) e!616979)))

(declare-fun array_inv!25755 (array!69229) Bool)

(assert (=> start!95642 (array_inv!25755 _keys!1070)))

(assert (= (and start!95642 res!718507) b!1078869))

(assert (= (and b!1078869 res!718508) b!1078868))

(assert (= (and b!1078868 res!718506) b!1078866))

(assert (= (and b!1078867 condMapEmpty!40921) mapIsEmpty!40921))

(assert (= (and b!1078867 (not condMapEmpty!40921)) mapNonEmpty!40921))

(get-info :version)

(assert (= (and mapNonEmpty!40921 ((_ is ValueCellFull!12350) mapValue!40921)) b!1078870))

(assert (= (and b!1078867 ((_ is ValueCellFull!12350) mapDefault!40921)) b!1078871))

(assert (= start!95642 b!1078867))

(declare-fun m!998031 () Bool)

(assert (=> mapNonEmpty!40921 m!998031))

(declare-fun m!998033 () Bool)

(assert (=> b!1078866 m!998033))

(declare-fun m!998035 () Bool)

(assert (=> b!1078868 m!998035))

(declare-fun m!998037 () Bool)

(assert (=> start!95642 m!998037))

(declare-fun m!998039 () Bool)

(assert (=> start!95642 m!998039))

(declare-fun m!998041 () Bool)

(assert (=> start!95642 m!998041))

(check-sat (not b!1078866) tp_is_empty!26119 (not b!1078868) (not mapNonEmpty!40921) (not start!95642))
(check-sat)
