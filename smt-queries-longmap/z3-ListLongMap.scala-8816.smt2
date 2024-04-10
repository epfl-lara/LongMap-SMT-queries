; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107122 () Bool)

(assert start!107122)

(declare-fun b_free!27627 () Bool)

(declare-fun b_next!27627 () Bool)

(assert (=> start!107122 (= b_free!27627 (not b_next!27627))))

(declare-fun tp!97108 () Bool)

(declare-fun b_and!45659 () Bool)

(assert (=> start!107122 (= tp!97108 b_and!45659)))

(declare-fun b!1270059 () Bool)

(declare-fun res!845192 () Bool)

(declare-fun e!723915 () Bool)

(assert (=> b!1270059 (=> (not res!845192) (not e!723915))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82884 0))(
  ( (array!82885 (arr!39979 (Array (_ BitVec 32) (_ BitVec 64))) (size!40515 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82884)

(assert (=> b!1270059 (= res!845192 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40515 _keys!1364)) (bvslt from!1698 (size!40515 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270060 () Bool)

(declare-fun e!723914 () Bool)

(declare-fun tp_is_empty!32811 () Bool)

(assert (=> b!1270060 (= e!723914 tp_is_empty!32811)))

(declare-fun b!1270061 () Bool)

(declare-fun res!845193 () Bool)

(assert (=> b!1270061 (=> (not res!845193) (not e!723915))))

(declare-datatypes ((V!48941 0))(
  ( (V!48942 (val!16480 Int)) )
))
(declare-datatypes ((ValueCell!15552 0))(
  ( (ValueCellFull!15552 (v!19117 V!48941)) (EmptyCell!15552) )
))
(declare-datatypes ((array!82886 0))(
  ( (array!82887 (arr!39980 (Array (_ BitVec 32) ValueCell!15552)) (size!40516 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82886)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270061 (= res!845193 (and (= (size!40516 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40515 _keys!1364) (size!40516 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270063 () Bool)

(declare-fun e!723918 () Bool)

(declare-fun e!723916 () Bool)

(declare-fun mapRes!50797 () Bool)

(assert (=> b!1270063 (= e!723918 (and e!723916 mapRes!50797))))

(declare-fun condMapEmpty!50797 () Bool)

(declare-fun mapDefault!50797 () ValueCell!15552)

(assert (=> b!1270063 (= condMapEmpty!50797 (= (arr!39980 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15552)) mapDefault!50797)))))

(declare-fun b!1270064 () Bool)

(assert (=> b!1270064 (= e!723916 tp_is_empty!32811)))

(declare-fun b!1270062 () Bool)

(declare-fun res!845195 () Bool)

(assert (=> b!1270062 (=> (not res!845195) (not e!723915))))

(declare-datatypes ((List!28464 0))(
  ( (Nil!28461) (Cons!28460 (h!29669 (_ BitVec 64)) (t!41993 List!28464)) )
))
(declare-fun arrayNoDuplicates!0 (array!82884 (_ BitVec 32) List!28464) Bool)

(assert (=> b!1270062 (= res!845195 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28461))))

(declare-fun res!845194 () Bool)

(assert (=> start!107122 (=> (not res!845194) (not e!723915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107122 (= res!845194 (validMask!0 mask!1730))))

(assert (=> start!107122 e!723915))

(declare-fun array_inv!30411 (array!82886) Bool)

(assert (=> start!107122 (and (array_inv!30411 _values!1134) e!723918)))

(assert (=> start!107122 true))

(declare-fun array_inv!30412 (array!82884) Bool)

(assert (=> start!107122 (array_inv!30412 _keys!1364)))

(assert (=> start!107122 tp_is_empty!32811))

(assert (=> start!107122 tp!97108))

(declare-fun b!1270065 () Bool)

(assert (=> b!1270065 (= e!723915 (not true))))

(declare-fun minValueAfter!52 () V!48941)

(declare-fun minValueBefore!52 () V!48941)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48941)

(declare-fun zeroValueBefore!52 () V!48941)

(declare-datatypes ((tuple2!21348 0))(
  ( (tuple2!21349 (_1!10685 (_ BitVec 64)) (_2!10685 V!48941)) )
))
(declare-datatypes ((List!28465 0))(
  ( (Nil!28462) (Cons!28461 (h!29670 tuple2!21348) (t!41994 List!28465)) )
))
(declare-datatypes ((ListLongMap!19077 0))(
  ( (ListLongMap!19078 (toList!9554 List!28465)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5886 (array!82884 array!82886 (_ BitVec 32) (_ BitVec 32) V!48941 V!48941 (_ BitVec 32) Int) ListLongMap!19077)

(assert (=> b!1270065 (= (getCurrentListMapNoExtraKeys!5886 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5886 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42294 0))(
  ( (Unit!42295) )
))
(declare-fun lt!574653 () Unit!42294)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1228 (array!82884 array!82886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48941 V!48941 V!48941 V!48941 (_ BitVec 32) Int) Unit!42294)

(assert (=> b!1270065 (= lt!574653 (lemmaNoChangeToArrayThenSameMapNoExtras!1228 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270066 () Bool)

(declare-fun res!845191 () Bool)

(assert (=> b!1270066 (=> (not res!845191) (not e!723915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82884 (_ BitVec 32)) Bool)

(assert (=> b!1270066 (= res!845191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50797 () Bool)

(declare-fun tp!97107 () Bool)

(assert (=> mapNonEmpty!50797 (= mapRes!50797 (and tp!97107 e!723914))))

(declare-fun mapKey!50797 () (_ BitVec 32))

(declare-fun mapValue!50797 () ValueCell!15552)

(declare-fun mapRest!50797 () (Array (_ BitVec 32) ValueCell!15552))

(assert (=> mapNonEmpty!50797 (= (arr!39980 _values!1134) (store mapRest!50797 mapKey!50797 mapValue!50797))))

(declare-fun mapIsEmpty!50797 () Bool)

(assert (=> mapIsEmpty!50797 mapRes!50797))

(assert (= (and start!107122 res!845194) b!1270061))

(assert (= (and b!1270061 res!845193) b!1270066))

(assert (= (and b!1270066 res!845191) b!1270062))

(assert (= (and b!1270062 res!845195) b!1270059))

(assert (= (and b!1270059 res!845192) b!1270065))

(assert (= (and b!1270063 condMapEmpty!50797) mapIsEmpty!50797))

(assert (= (and b!1270063 (not condMapEmpty!50797)) mapNonEmpty!50797))

(get-info :version)

(assert (= (and mapNonEmpty!50797 ((_ is ValueCellFull!15552) mapValue!50797)) b!1270060))

(assert (= (and b!1270063 ((_ is ValueCellFull!15552) mapDefault!50797)) b!1270064))

(assert (= start!107122 b!1270063))

(declare-fun m!1168445 () Bool)

(assert (=> start!107122 m!1168445))

(declare-fun m!1168447 () Bool)

(assert (=> start!107122 m!1168447))

(declare-fun m!1168449 () Bool)

(assert (=> start!107122 m!1168449))

(declare-fun m!1168451 () Bool)

(assert (=> mapNonEmpty!50797 m!1168451))

(declare-fun m!1168453 () Bool)

(assert (=> b!1270062 m!1168453))

(declare-fun m!1168455 () Bool)

(assert (=> b!1270066 m!1168455))

(declare-fun m!1168457 () Bool)

(assert (=> b!1270065 m!1168457))

(declare-fun m!1168459 () Bool)

(assert (=> b!1270065 m!1168459))

(declare-fun m!1168461 () Bool)

(assert (=> b!1270065 m!1168461))

(check-sat (not start!107122) tp_is_empty!32811 (not b!1270062) (not b_next!27627) (not b!1270065) (not b!1270066) b_and!45659 (not mapNonEmpty!50797))
(check-sat b_and!45659 (not b_next!27627))
