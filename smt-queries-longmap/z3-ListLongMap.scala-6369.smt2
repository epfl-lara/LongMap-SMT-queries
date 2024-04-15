; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81932 () Bool)

(assert start!81932)

(declare-fun b!955694 () Bool)

(declare-fun e!538376 () Bool)

(declare-fun e!538380 () Bool)

(declare-fun mapRes!33445 () Bool)

(assert (=> b!955694 (= e!538376 (and e!538380 mapRes!33445))))

(declare-fun condMapEmpty!33445 () Bool)

(declare-datatypes ((V!32969 0))(
  ( (V!32970 (val!10545 Int)) )
))
(declare-datatypes ((ValueCell!10013 0))(
  ( (ValueCellFull!10013 (v!13099 V!32969)) (EmptyCell!10013) )
))
(declare-datatypes ((array!58036 0))(
  ( (array!58037 (arr!27898 (Array (_ BitVec 32) ValueCell!10013)) (size!28379 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58036)

(declare-fun mapDefault!33445 () ValueCell!10013)

(assert (=> b!955694 (= condMapEmpty!33445 (= (arr!27898 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10013)) mapDefault!33445)))))

(declare-fun res!640039 () Bool)

(declare-fun e!538379 () Bool)

(assert (=> start!81932 (=> (not res!640039) (not e!538379))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81932 (= res!640039 (validMask!0 mask!1823))))

(assert (=> start!81932 e!538379))

(assert (=> start!81932 true))

(declare-fun array_inv!21713 (array!58036) Bool)

(assert (=> start!81932 (and (array_inv!21713 _values!1197) e!538376)))

(declare-datatypes ((array!58038 0))(
  ( (array!58039 (arr!27899 (Array (_ BitVec 32) (_ BitVec 64))) (size!28380 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58038)

(declare-fun array_inv!21714 (array!58038) Bool)

(assert (=> start!81932 (array_inv!21714 _keys!1441)))

(declare-fun b!955695 () Bool)

(declare-fun res!640038 () Bool)

(assert (=> b!955695 (=> (not res!640038) (not e!538379))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955695 (= res!640038 (and (= (size!28379 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28380 _keys!1441) (size!28379 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955696 () Bool)

(declare-fun res!640037 () Bool)

(assert (=> b!955696 (=> (not res!640037) (not e!538379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58038 (_ BitVec 32)) Bool)

(assert (=> b!955696 (= res!640037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955697 () Bool)

(assert (=> b!955697 (= e!538379 false)))

(declare-fun lt!429825 () Bool)

(declare-datatypes ((List!19475 0))(
  ( (Nil!19472) (Cons!19471 (h!20633 (_ BitVec 64)) (t!27827 List!19475)) )
))
(declare-fun arrayNoDuplicates!0 (array!58038 (_ BitVec 32) List!19475) Bool)

(assert (=> b!955697 (= lt!429825 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19472))))

(declare-fun b!955698 () Bool)

(declare-fun tp_is_empty!20989 () Bool)

(assert (=> b!955698 (= e!538380 tp_is_empty!20989)))

(declare-fun mapIsEmpty!33445 () Bool)

(assert (=> mapIsEmpty!33445 mapRes!33445))

(declare-fun b!955699 () Bool)

(declare-fun e!538377 () Bool)

(assert (=> b!955699 (= e!538377 tp_is_empty!20989)))

(declare-fun mapNonEmpty!33445 () Bool)

(declare-fun tp!64024 () Bool)

(assert (=> mapNonEmpty!33445 (= mapRes!33445 (and tp!64024 e!538377))))

(declare-fun mapRest!33445 () (Array (_ BitVec 32) ValueCell!10013))

(declare-fun mapKey!33445 () (_ BitVec 32))

(declare-fun mapValue!33445 () ValueCell!10013)

(assert (=> mapNonEmpty!33445 (= (arr!27898 _values!1197) (store mapRest!33445 mapKey!33445 mapValue!33445))))

(assert (= (and start!81932 res!640039) b!955695))

(assert (= (and b!955695 res!640038) b!955696))

(assert (= (and b!955696 res!640037) b!955697))

(assert (= (and b!955694 condMapEmpty!33445) mapIsEmpty!33445))

(assert (= (and b!955694 (not condMapEmpty!33445)) mapNonEmpty!33445))

(get-info :version)

(assert (= (and mapNonEmpty!33445 ((_ is ValueCellFull!10013) mapValue!33445)) b!955699))

(assert (= (and b!955694 ((_ is ValueCellFull!10013) mapDefault!33445)) b!955698))

(assert (= start!81932 b!955694))

(declare-fun m!886623 () Bool)

(assert (=> start!81932 m!886623))

(declare-fun m!886625 () Bool)

(assert (=> start!81932 m!886625))

(declare-fun m!886627 () Bool)

(assert (=> start!81932 m!886627))

(declare-fun m!886629 () Bool)

(assert (=> b!955696 m!886629))

(declare-fun m!886631 () Bool)

(assert (=> b!955697 m!886631))

(declare-fun m!886633 () Bool)

(assert (=> mapNonEmpty!33445 m!886633))

(check-sat (not start!81932) (not b!955696) tp_is_empty!20989 (not mapNonEmpty!33445) (not b!955697))
(check-sat)
