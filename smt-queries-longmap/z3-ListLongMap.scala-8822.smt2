; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107380 () Bool)

(assert start!107380)

(declare-fun b!1271732 () Bool)

(declare-fun e!725020 () Bool)

(declare-fun tp_is_empty!32845 () Bool)

(assert (=> b!1271732 (= e!725020 tp_is_empty!32845)))

(declare-fun b!1271733 () Bool)

(declare-fun e!725017 () Bool)

(declare-fun mapRes!50848 () Bool)

(assert (=> b!1271733 (= e!725017 (and e!725020 mapRes!50848))))

(declare-fun condMapEmpty!50848 () Bool)

(declare-datatypes ((V!48987 0))(
  ( (V!48988 (val!16497 Int)) )
))
(declare-datatypes ((ValueCell!15569 0))(
  ( (ValueCellFull!15569 (v!19129 V!48987)) (EmptyCell!15569) )
))
(declare-datatypes ((array!82983 0))(
  ( (array!82984 (arr!40024 (Array (_ BitVec 32) ValueCell!15569)) (size!40561 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82983)

(declare-fun mapDefault!50848 () ValueCell!15569)

(assert (=> b!1271733 (= condMapEmpty!50848 (= (arr!40024 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15569)) mapDefault!50848)))))

(declare-fun mapIsEmpty!50848 () Bool)

(assert (=> mapIsEmpty!50848 mapRes!50848))

(declare-fun mapNonEmpty!50848 () Bool)

(declare-fun tp!97189 () Bool)

(declare-fun e!725019 () Bool)

(assert (=> mapNonEmpty!50848 (= mapRes!50848 (and tp!97189 e!725019))))

(declare-fun mapValue!50848 () ValueCell!15569)

(declare-fun mapRest!50848 () (Array (_ BitVec 32) ValueCell!15569))

(declare-fun mapKey!50848 () (_ BitVec 32))

(assert (=> mapNonEmpty!50848 (= (arr!40024 _values!1134) (store mapRest!50848 mapKey!50848 mapValue!50848))))

(declare-fun b!1271735 () Bool)

(declare-fun res!845928 () Bool)

(declare-fun e!725016 () Bool)

(assert (=> b!1271735 (=> (not res!845928) (not e!725016))))

(declare-datatypes ((array!82985 0))(
  ( (array!82986 (arr!40025 (Array (_ BitVec 32) (_ BitVec 64))) (size!40562 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82985)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82985 (_ BitVec 32)) Bool)

(assert (=> b!1271735 (= res!845928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271734 () Bool)

(declare-fun res!845926 () Bool)

(assert (=> b!1271734 (=> (not res!845926) (not e!725016))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271734 (= res!845926 (and (= (size!40561 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40562 _keys!1364) (size!40561 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845927 () Bool)

(assert (=> start!107380 (=> (not res!845927) (not e!725016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107380 (= res!845927 (validMask!0 mask!1730))))

(assert (=> start!107380 e!725016))

(declare-fun array_inv!30617 (array!82983) Bool)

(assert (=> start!107380 (and (array_inv!30617 _values!1134) e!725017)))

(assert (=> start!107380 true))

(declare-fun array_inv!30618 (array!82985) Bool)

(assert (=> start!107380 (array_inv!30618 _keys!1364)))

(declare-fun b!1271736 () Bool)

(assert (=> b!1271736 (= e!725019 tp_is_empty!32845)))

(declare-fun b!1271737 () Bool)

(assert (=> b!1271737 (= e!725016 false)))

(declare-fun lt!575188 () Bool)

(declare-datatypes ((List!28520 0))(
  ( (Nil!28517) (Cons!28516 (h!29734 (_ BitVec 64)) (t!42041 List!28520)) )
))
(declare-fun arrayNoDuplicates!0 (array!82985 (_ BitVec 32) List!28520) Bool)

(assert (=> b!1271737 (= lt!575188 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28517))))

(assert (= (and start!107380 res!845927) b!1271734))

(assert (= (and b!1271734 res!845926) b!1271735))

(assert (= (and b!1271735 res!845928) b!1271737))

(assert (= (and b!1271733 condMapEmpty!50848) mapIsEmpty!50848))

(assert (= (and b!1271733 (not condMapEmpty!50848)) mapNonEmpty!50848))

(get-info :version)

(assert (= (and mapNonEmpty!50848 ((_ is ValueCellFull!15569) mapValue!50848)) b!1271736))

(assert (= (and b!1271733 ((_ is ValueCellFull!15569) mapDefault!50848)) b!1271732))

(assert (= start!107380 b!1271733))

(declare-fun m!1170327 () Bool)

(assert (=> mapNonEmpty!50848 m!1170327))

(declare-fun m!1170329 () Bool)

(assert (=> b!1271735 m!1170329))

(declare-fun m!1170331 () Bool)

(assert (=> start!107380 m!1170331))

(declare-fun m!1170333 () Bool)

(assert (=> start!107380 m!1170333))

(declare-fun m!1170335 () Bool)

(assert (=> start!107380 m!1170335))

(declare-fun m!1170337 () Bool)

(assert (=> b!1271737 m!1170337))

(check-sat tp_is_empty!32845 (not mapNonEmpty!50848) (not b!1271737) (not b!1271735) (not start!107380))
(check-sat)
