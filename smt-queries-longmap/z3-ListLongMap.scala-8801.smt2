; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107032 () Bool)

(assert start!107032)

(declare-fun b!1268987 () Bool)

(declare-fun e!723241 () Bool)

(declare-fun e!723243 () Bool)

(declare-fun mapRes!50662 () Bool)

(assert (=> b!1268987 (= e!723241 (and e!723243 mapRes!50662))))

(declare-fun condMapEmpty!50662 () Bool)

(declare-datatypes ((V!48821 0))(
  ( (V!48822 (val!16435 Int)) )
))
(declare-datatypes ((ValueCell!15507 0))(
  ( (ValueCellFull!15507 (v!19072 V!48821)) (EmptyCell!15507) )
))
(declare-datatypes ((array!82708 0))(
  ( (array!82709 (arr!39891 (Array (_ BitVec 32) ValueCell!15507)) (size!40427 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82708)

(declare-fun mapDefault!50662 () ValueCell!15507)

(assert (=> b!1268987 (= condMapEmpty!50662 (= (arr!39891 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15507)) mapDefault!50662)))))

(declare-fun b!1268988 () Bool)

(declare-fun res!844526 () Bool)

(declare-fun e!723239 () Bool)

(assert (=> b!1268988 (=> (not res!844526) (not e!723239))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82710 0))(
  ( (array!82711 (arr!39892 (Array (_ BitVec 32) (_ BitVec 64))) (size!40428 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82710)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268988 (= res!844526 (and (= (size!40427 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40428 _keys!1364) (size!40427 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50662 () Bool)

(declare-fun tp!96841 () Bool)

(declare-fun e!723242 () Bool)

(assert (=> mapNonEmpty!50662 (= mapRes!50662 (and tp!96841 e!723242))))

(declare-fun mapRest!50662 () (Array (_ BitVec 32) ValueCell!15507))

(declare-fun mapValue!50662 () ValueCell!15507)

(declare-fun mapKey!50662 () (_ BitVec 32))

(assert (=> mapNonEmpty!50662 (= (arr!39891 _values!1134) (store mapRest!50662 mapKey!50662 mapValue!50662))))

(declare-fun res!844525 () Bool)

(assert (=> start!107032 (=> (not res!844525) (not e!723239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107032 (= res!844525 (validMask!0 mask!1730))))

(assert (=> start!107032 e!723239))

(declare-fun array_inv!30351 (array!82708) Bool)

(assert (=> start!107032 (and (array_inv!30351 _values!1134) e!723241)))

(assert (=> start!107032 true))

(declare-fun array_inv!30352 (array!82710) Bool)

(assert (=> start!107032 (array_inv!30352 _keys!1364)))

(declare-fun b!1268989 () Bool)

(declare-fun tp_is_empty!32721 () Bool)

(assert (=> b!1268989 (= e!723242 tp_is_empty!32721)))

(declare-fun b!1268990 () Bool)

(assert (=> b!1268990 (= e!723239 false)))

(declare-fun lt!574518 () Bool)

(declare-datatypes ((List!28402 0))(
  ( (Nil!28399) (Cons!28398 (h!29607 (_ BitVec 64)) (t!41931 List!28402)) )
))
(declare-fun arrayNoDuplicates!0 (array!82710 (_ BitVec 32) List!28402) Bool)

(assert (=> b!1268990 (= lt!574518 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28399))))

(declare-fun b!1268991 () Bool)

(assert (=> b!1268991 (= e!723243 tp_is_empty!32721)))

(declare-fun b!1268992 () Bool)

(declare-fun res!844524 () Bool)

(assert (=> b!1268992 (=> (not res!844524) (not e!723239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82710 (_ BitVec 32)) Bool)

(assert (=> b!1268992 (= res!844524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50662 () Bool)

(assert (=> mapIsEmpty!50662 mapRes!50662))

(assert (= (and start!107032 res!844525) b!1268988))

(assert (= (and b!1268988 res!844526) b!1268992))

(assert (= (and b!1268992 res!844524) b!1268990))

(assert (= (and b!1268987 condMapEmpty!50662) mapIsEmpty!50662))

(assert (= (and b!1268987 (not condMapEmpty!50662)) mapNonEmpty!50662))

(get-info :version)

(assert (= (and mapNonEmpty!50662 ((_ is ValueCellFull!15507) mapValue!50662)) b!1268989))

(assert (= (and b!1268987 ((_ is ValueCellFull!15507) mapDefault!50662)) b!1268991))

(assert (= start!107032 b!1268987))

(declare-fun m!1167647 () Bool)

(assert (=> mapNonEmpty!50662 m!1167647))

(declare-fun m!1167649 () Bool)

(assert (=> start!107032 m!1167649))

(declare-fun m!1167651 () Bool)

(assert (=> start!107032 m!1167651))

(declare-fun m!1167653 () Bool)

(assert (=> start!107032 m!1167653))

(declare-fun m!1167655 () Bool)

(assert (=> b!1268990 m!1167655))

(declare-fun m!1167657 () Bool)

(assert (=> b!1268992 m!1167657))

(check-sat (not b!1268992) (not b!1268990) tp_is_empty!32721 (not mapNonEmpty!50662) (not start!107032))
(check-sat)
