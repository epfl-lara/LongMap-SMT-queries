; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81950 () Bool)

(assert start!81950)

(declare-fun b!955856 () Bool)

(declare-fun e!538512 () Bool)

(declare-fun tp_is_empty!21007 () Bool)

(assert (=> b!955856 (= e!538512 tp_is_empty!21007)))

(declare-fun b!955857 () Bool)

(declare-fun e!538515 () Bool)

(declare-fun mapRes!33472 () Bool)

(assert (=> b!955857 (= e!538515 (and e!538512 mapRes!33472))))

(declare-fun condMapEmpty!33472 () Bool)

(declare-datatypes ((V!32993 0))(
  ( (V!32994 (val!10554 Int)) )
))
(declare-datatypes ((ValueCell!10022 0))(
  ( (ValueCellFull!10022 (v!13108 V!32993)) (EmptyCell!10022) )
))
(declare-datatypes ((array!58066 0))(
  ( (array!58067 (arr!27913 (Array (_ BitVec 32) ValueCell!10022)) (size!28394 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58066)

(declare-fun mapDefault!33472 () ValueCell!10022)

(assert (=> b!955857 (= condMapEmpty!33472 (= (arr!27913 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10022)) mapDefault!33472)))))

(declare-fun b!955858 () Bool)

(declare-fun e!538514 () Bool)

(assert (=> b!955858 (= e!538514 false)))

(declare-fun lt!429852 () Bool)

(declare-datatypes ((array!58068 0))(
  ( (array!58069 (arr!27914 (Array (_ BitVec 32) (_ BitVec 64))) (size!28395 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58068)

(declare-datatypes ((List!19480 0))(
  ( (Nil!19477) (Cons!19476 (h!20638 (_ BitVec 64)) (t!27832 List!19480)) )
))
(declare-fun arrayNoDuplicates!0 (array!58068 (_ BitVec 32) List!19480) Bool)

(assert (=> b!955858 (= lt!429852 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19477))))

(declare-fun res!640120 () Bool)

(assert (=> start!81950 (=> (not res!640120) (not e!538514))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81950 (= res!640120 (validMask!0 mask!1823))))

(assert (=> start!81950 e!538514))

(assert (=> start!81950 true))

(declare-fun array_inv!21723 (array!58066) Bool)

(assert (=> start!81950 (and (array_inv!21723 _values!1197) e!538515)))

(declare-fun array_inv!21724 (array!58068) Bool)

(assert (=> start!81950 (array_inv!21724 _keys!1441)))

(declare-fun b!955859 () Bool)

(declare-fun e!538511 () Bool)

(assert (=> b!955859 (= e!538511 tp_is_empty!21007)))

(declare-fun mapIsEmpty!33472 () Bool)

(assert (=> mapIsEmpty!33472 mapRes!33472))

(declare-fun b!955860 () Bool)

(declare-fun res!640118 () Bool)

(assert (=> b!955860 (=> (not res!640118) (not e!538514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58068 (_ BitVec 32)) Bool)

(assert (=> b!955860 (= res!640118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33472 () Bool)

(declare-fun tp!64051 () Bool)

(assert (=> mapNonEmpty!33472 (= mapRes!33472 (and tp!64051 e!538511))))

(declare-fun mapValue!33472 () ValueCell!10022)

(declare-fun mapKey!33472 () (_ BitVec 32))

(declare-fun mapRest!33472 () (Array (_ BitVec 32) ValueCell!10022))

(assert (=> mapNonEmpty!33472 (= (arr!27913 _values!1197) (store mapRest!33472 mapKey!33472 mapValue!33472))))

(declare-fun b!955861 () Bool)

(declare-fun res!640119 () Bool)

(assert (=> b!955861 (=> (not res!640119) (not e!538514))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955861 (= res!640119 (and (= (size!28394 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28395 _keys!1441) (size!28394 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(assert (= (and start!81950 res!640120) b!955861))

(assert (= (and b!955861 res!640119) b!955860))

(assert (= (and b!955860 res!640118) b!955858))

(assert (= (and b!955857 condMapEmpty!33472) mapIsEmpty!33472))

(assert (= (and b!955857 (not condMapEmpty!33472)) mapNonEmpty!33472))

(get-info :version)

(assert (= (and mapNonEmpty!33472 ((_ is ValueCellFull!10022) mapValue!33472)) b!955859))

(assert (= (and b!955857 ((_ is ValueCellFull!10022) mapDefault!33472)) b!955856))

(assert (= start!81950 b!955857))

(declare-fun m!886731 () Bool)

(assert (=> b!955858 m!886731))

(declare-fun m!886733 () Bool)

(assert (=> start!81950 m!886733))

(declare-fun m!886735 () Bool)

(assert (=> start!81950 m!886735))

(declare-fun m!886737 () Bool)

(assert (=> start!81950 m!886737))

(declare-fun m!886739 () Bool)

(assert (=> b!955860 m!886739))

(declare-fun m!886741 () Bool)

(assert (=> mapNonEmpty!33472 m!886741))

(check-sat tp_is_empty!21007 (not start!81950) (not b!955858) (not mapNonEmpty!33472) (not b!955860))
(check-sat)
