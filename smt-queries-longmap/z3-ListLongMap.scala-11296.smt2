; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131630 () Bool)

(assert start!131630)

(declare-fun b!1541762 () Bool)

(declare-fun e!857628 () Bool)

(assert (=> b!1541762 (= e!857628 false)))

(declare-fun lt!665470 () Bool)

(declare-datatypes ((array!102512 0))(
  ( (array!102513 (arr!49459 (Array (_ BitVec 32) (_ BitVec 64))) (size!50011 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102512)

(declare-datatypes ((List!35914 0))(
  ( (Nil!35911) (Cons!35910 (h!37356 (_ BitVec 64)) (t!50600 List!35914)) )
))
(declare-fun arrayNoDuplicates!0 (array!102512 (_ BitVec 32) List!35914) Bool)

(assert (=> b!1541762 (= lt!665470 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35911))))

(declare-fun mapNonEmpty!58207 () Bool)

(declare-fun mapRes!58207 () Bool)

(declare-fun tp!110735 () Bool)

(declare-fun e!857627 () Bool)

(assert (=> mapNonEmpty!58207 (= mapRes!58207 (and tp!110735 e!857627))))

(declare-datatypes ((V!58669 0))(
  ( (V!58670 (val!18912 Int)) )
))
(declare-datatypes ((ValueCell!17924 0))(
  ( (ValueCellFull!17924 (v!21709 V!58669)) (EmptyCell!17924) )
))
(declare-datatypes ((array!102514 0))(
  ( (array!102515 (arr!49460 (Array (_ BitVec 32) ValueCell!17924)) (size!50012 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102514)

(declare-fun mapValue!58207 () ValueCell!17924)

(declare-fun mapRest!58207 () (Array (_ BitVec 32) ValueCell!17924))

(declare-fun mapKey!58207 () (_ BitVec 32))

(assert (=> mapNonEmpty!58207 (= (arr!49460 _values!470) (store mapRest!58207 mapKey!58207 mapValue!58207))))

(declare-fun res!1058183 () Bool)

(assert (=> start!131630 (=> (not res!1058183) (not e!857628))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131630 (= res!1058183 (validMask!0 mask!926))))

(assert (=> start!131630 e!857628))

(assert (=> start!131630 true))

(declare-fun e!857631 () Bool)

(declare-fun array_inv!38675 (array!102514) Bool)

(assert (=> start!131630 (and (array_inv!38675 _values!470) e!857631)))

(declare-fun array_inv!38676 (array!102512) Bool)

(assert (=> start!131630 (array_inv!38676 _keys!618)))

(declare-fun b!1541763 () Bool)

(declare-fun e!857630 () Bool)

(declare-fun tp_is_empty!37669 () Bool)

(assert (=> b!1541763 (= e!857630 tp_is_empty!37669)))

(declare-fun b!1541764 () Bool)

(assert (=> b!1541764 (= e!857627 tp_is_empty!37669)))

(declare-fun mapIsEmpty!58207 () Bool)

(assert (=> mapIsEmpty!58207 mapRes!58207))

(declare-fun b!1541765 () Bool)

(declare-fun res!1058182 () Bool)

(assert (=> b!1541765 (=> (not res!1058182) (not e!857628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102512 (_ BitVec 32)) Bool)

(assert (=> b!1541765 (= res!1058182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541766 () Bool)

(assert (=> b!1541766 (= e!857631 (and e!857630 mapRes!58207))))

(declare-fun condMapEmpty!58207 () Bool)

(declare-fun mapDefault!58207 () ValueCell!17924)

(assert (=> b!1541766 (= condMapEmpty!58207 (= (arr!49460 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17924)) mapDefault!58207)))))

(declare-fun b!1541767 () Bool)

(declare-fun res!1058184 () Bool)

(assert (=> b!1541767 (=> (not res!1058184) (not e!857628))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1541767 (= res!1058184 (and (= (size!50012 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50011 _keys!618) (size!50012 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!131630 res!1058183) b!1541767))

(assert (= (and b!1541767 res!1058184) b!1541765))

(assert (= (and b!1541765 res!1058182) b!1541762))

(assert (= (and b!1541766 condMapEmpty!58207) mapIsEmpty!58207))

(assert (= (and b!1541766 (not condMapEmpty!58207)) mapNonEmpty!58207))

(get-info :version)

(assert (= (and mapNonEmpty!58207 ((_ is ValueCellFull!17924) mapValue!58207)) b!1541764))

(assert (= (and b!1541766 ((_ is ValueCellFull!17924) mapDefault!58207)) b!1541763))

(assert (= start!131630 b!1541766))

(declare-fun m!1422945 () Bool)

(assert (=> b!1541762 m!1422945))

(declare-fun m!1422947 () Bool)

(assert (=> mapNonEmpty!58207 m!1422947))

(declare-fun m!1422949 () Bool)

(assert (=> start!131630 m!1422949))

(declare-fun m!1422951 () Bool)

(assert (=> start!131630 m!1422951))

(declare-fun m!1422953 () Bool)

(assert (=> start!131630 m!1422953))

(declare-fun m!1422955 () Bool)

(assert (=> b!1541765 m!1422955))

(check-sat (not mapNonEmpty!58207) (not b!1541762) tp_is_empty!37669 (not b!1541765) (not start!131630))
(check-sat)
