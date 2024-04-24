; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95726 () Bool)

(assert start!95726)

(declare-fun b!1079679 () Bool)

(declare-fun e!617427 () Bool)

(declare-fun e!617424 () Bool)

(assert (=> b!1079679 (= e!617427 e!617424)))

(declare-fun res!719071 () Bool)

(assert (=> b!1079679 (=> (not res!719071) (not e!617424))))

(declare-datatypes ((array!69313 0))(
  ( (array!69314 (arr!33325 (Array (_ BitVec 32) (_ BitVec 64))) (size!33862 (_ BitVec 32))) )
))
(declare-fun lt!479135 () array!69313)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69313 (_ BitVec 32)) Bool)

(assert (=> b!1079679 (= res!719071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479135 mask!1414))))

(declare-fun _keys!1070 () array!69313)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079679 (= lt!479135 (array!69314 (store (arr!33325 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33862 _keys!1070)))))

(declare-fun b!1079680 () Bool)

(declare-fun e!617425 () Bool)

(declare-fun tp_is_empty!26161 () Bool)

(assert (=> b!1079680 (= e!617425 tp_is_empty!26161)))

(declare-fun mapIsEmpty!40993 () Bool)

(declare-fun mapRes!40993 () Bool)

(assert (=> mapIsEmpty!40993 mapRes!40993))

(declare-fun b!1079681 () Bool)

(declare-fun res!719069 () Bool)

(assert (=> b!1079681 (=> (not res!719069) (not e!617427))))

(declare-datatypes ((List!23246 0))(
  ( (Nil!23243) (Cons!23242 (h!24460 (_ BitVec 64)) (t!32597 List!23246)) )
))
(declare-fun arrayNoDuplicates!0 (array!69313 (_ BitVec 32) List!23246) Bool)

(assert (=> b!1079681 (= res!719069 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23243))))

(declare-fun b!1079682 () Bool)

(declare-fun e!617426 () Bool)

(assert (=> b!1079682 (= e!617426 (and e!617425 mapRes!40993))))

(declare-fun condMapEmpty!40993 () Bool)

(declare-datatypes ((V!40009 0))(
  ( (V!40010 (val!13137 Int)) )
))
(declare-datatypes ((ValueCell!12371 0))(
  ( (ValueCellFull!12371 (v!15754 V!40009)) (EmptyCell!12371) )
))
(declare-datatypes ((array!69315 0))(
  ( (array!69316 (arr!33326 (Array (_ BitVec 32) ValueCell!12371)) (size!33863 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69315)

(declare-fun mapDefault!40993 () ValueCell!12371)

(assert (=> b!1079682 (= condMapEmpty!40993 (= (arr!33326 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12371)) mapDefault!40993)))))

(declare-fun b!1079683 () Bool)

(declare-fun res!719064 () Bool)

(assert (=> b!1079683 (=> (not res!719064) (not e!617427))))

(assert (=> b!1079683 (= res!719064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079684 () Bool)

(declare-fun res!719065 () Bool)

(assert (=> b!1079684 (=> (not res!719065) (not e!617427))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079684 (= res!719065 (validKeyInArray!0 k0!904))))

(declare-fun res!719070 () Bool)

(assert (=> start!95726 (=> (not res!719070) (not e!617427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95726 (= res!719070 (validMask!0 mask!1414))))

(assert (=> start!95726 e!617427))

(assert (=> start!95726 true))

(declare-fun array_inv!25780 (array!69313) Bool)

(assert (=> start!95726 (array_inv!25780 _keys!1070)))

(declare-fun array_inv!25781 (array!69315) Bool)

(assert (=> start!95726 (and (array_inv!25781 _values!874) e!617426)))

(declare-fun mapNonEmpty!40993 () Bool)

(declare-fun tp!78455 () Bool)

(declare-fun e!617428 () Bool)

(assert (=> mapNonEmpty!40993 (= mapRes!40993 (and tp!78455 e!617428))))

(declare-fun mapRest!40993 () (Array (_ BitVec 32) ValueCell!12371))

(declare-fun mapValue!40993 () ValueCell!12371)

(declare-fun mapKey!40993 () (_ BitVec 32))

(assert (=> mapNonEmpty!40993 (= (arr!33326 _values!874) (store mapRest!40993 mapKey!40993 mapValue!40993))))

(declare-fun b!1079685 () Bool)

(declare-fun res!719068 () Bool)

(assert (=> b!1079685 (=> (not res!719068) (not e!617427))))

(assert (=> b!1079685 (= res!719068 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33862 _keys!1070))))))

(declare-fun b!1079686 () Bool)

(declare-fun res!719066 () Bool)

(assert (=> b!1079686 (=> (not res!719066) (not e!617427))))

(assert (=> b!1079686 (= res!719066 (= (select (arr!33325 _keys!1070) i!650) k0!904))))

(declare-fun b!1079687 () Bool)

(assert (=> b!1079687 (= e!617428 tp_is_empty!26161)))

(declare-fun b!1079688 () Bool)

(declare-fun res!719067 () Bool)

(assert (=> b!1079688 (=> (not res!719067) (not e!617427))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079688 (= res!719067 (and (= (size!33863 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33862 _keys!1070) (size!33863 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079689 () Bool)

(assert (=> b!1079689 (= e!617424 false)))

(declare-fun lt!479136 () Bool)

(assert (=> b!1079689 (= lt!479136 (arrayNoDuplicates!0 lt!479135 #b00000000000000000000000000000000 Nil!23243))))

(assert (= (and start!95726 res!719070) b!1079688))

(assert (= (and b!1079688 res!719067) b!1079683))

(assert (= (and b!1079683 res!719064) b!1079681))

(assert (= (and b!1079681 res!719069) b!1079685))

(assert (= (and b!1079685 res!719068) b!1079684))

(assert (= (and b!1079684 res!719065) b!1079686))

(assert (= (and b!1079686 res!719066) b!1079679))

(assert (= (and b!1079679 res!719071) b!1079689))

(assert (= (and b!1079682 condMapEmpty!40993) mapIsEmpty!40993))

(assert (= (and b!1079682 (not condMapEmpty!40993)) mapNonEmpty!40993))

(get-info :version)

(assert (= (and mapNonEmpty!40993 ((_ is ValueCellFull!12371) mapValue!40993)) b!1079687))

(assert (= (and b!1079682 ((_ is ValueCellFull!12371) mapDefault!40993)) b!1079680))

(assert (= start!95726 b!1079682))

(declare-fun m!998553 () Bool)

(assert (=> mapNonEmpty!40993 m!998553))

(declare-fun m!998555 () Bool)

(assert (=> b!1079679 m!998555))

(declare-fun m!998557 () Bool)

(assert (=> b!1079679 m!998557))

(declare-fun m!998559 () Bool)

(assert (=> b!1079686 m!998559))

(declare-fun m!998561 () Bool)

(assert (=> b!1079683 m!998561))

(declare-fun m!998563 () Bool)

(assert (=> b!1079684 m!998563))

(declare-fun m!998565 () Bool)

(assert (=> start!95726 m!998565))

(declare-fun m!998567 () Bool)

(assert (=> start!95726 m!998567))

(declare-fun m!998569 () Bool)

(assert (=> start!95726 m!998569))

(declare-fun m!998571 () Bool)

(assert (=> b!1079681 m!998571))

(declare-fun m!998573 () Bool)

(assert (=> b!1079689 m!998573))

(check-sat (not b!1079683) (not b!1079681) (not b!1079684) (not b!1079679) (not start!95726) tp_is_empty!26161 (not mapNonEmpty!40993) (not b!1079689))
(check-sat)
