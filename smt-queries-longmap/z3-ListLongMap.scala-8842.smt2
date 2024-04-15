; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107276 () Bool)

(assert start!107276)

(declare-fun res!845919 () Bool)

(declare-fun e!725042 () Bool)

(assert (=> start!107276 (=> (not res!845919) (not e!725042))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107276 (= res!845919 (validMask!0 mask!1730))))

(assert (=> start!107276 e!725042))

(declare-datatypes ((V!49147 0))(
  ( (V!49148 (val!16557 Int)) )
))
(declare-datatypes ((ValueCell!15629 0))(
  ( (ValueCellFull!15629 (v!19193 V!49147)) (EmptyCell!15629) )
))
(declare-datatypes ((array!83087 0))(
  ( (array!83088 (arr!40081 (Array (_ BitVec 32) ValueCell!15629)) (size!40619 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83087)

(declare-fun e!725043 () Bool)

(declare-fun array_inv!30641 (array!83087) Bool)

(assert (=> start!107276 (and (array_inv!30641 _values!1134) e!725043)))

(assert (=> start!107276 true))

(declare-datatypes ((array!83089 0))(
  ( (array!83090 (arr!40082 (Array (_ BitVec 32) (_ BitVec 64))) (size!40620 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83089)

(declare-fun array_inv!30642 (array!83089) Bool)

(assert (=> start!107276 (array_inv!30642 _keys!1364)))

(declare-fun b!1271443 () Bool)

(declare-fun res!845921 () Bool)

(assert (=> b!1271443 (=> (not res!845921) (not e!725042))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271443 (= res!845921 (and (= (size!40619 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40620 _keys!1364) (size!40619 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51028 () Bool)

(declare-fun mapRes!51028 () Bool)

(declare-fun tp!97370 () Bool)

(declare-fun e!725044 () Bool)

(assert (=> mapNonEmpty!51028 (= mapRes!51028 (and tp!97370 e!725044))))

(declare-fun mapKey!51028 () (_ BitVec 32))

(declare-fun mapRest!51028 () (Array (_ BitVec 32) ValueCell!15629))

(declare-fun mapValue!51028 () ValueCell!15629)

(assert (=> mapNonEmpty!51028 (= (arr!40081 _values!1134) (store mapRest!51028 mapKey!51028 mapValue!51028))))

(declare-fun b!1271444 () Bool)

(declare-fun e!725040 () Bool)

(declare-fun tp_is_empty!32965 () Bool)

(assert (=> b!1271444 (= e!725040 tp_is_empty!32965)))

(declare-fun b!1271445 () Bool)

(assert (=> b!1271445 (= e!725043 (and e!725040 mapRes!51028))))

(declare-fun condMapEmpty!51028 () Bool)

(declare-fun mapDefault!51028 () ValueCell!15629)

(assert (=> b!1271445 (= condMapEmpty!51028 (= (arr!40081 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15629)) mapDefault!51028)))))

(declare-fun b!1271446 () Bool)

(declare-fun res!845920 () Bool)

(assert (=> b!1271446 (=> (not res!845920) (not e!725042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83089 (_ BitVec 32)) Bool)

(assert (=> b!1271446 (= res!845920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271447 () Bool)

(assert (=> b!1271447 (= e!725042 false)))

(declare-fun lt!574706 () Bool)

(declare-datatypes ((List!28604 0))(
  ( (Nil!28601) (Cons!28600 (h!29809 (_ BitVec 64)) (t!42125 List!28604)) )
))
(declare-fun arrayNoDuplicates!0 (array!83089 (_ BitVec 32) List!28604) Bool)

(assert (=> b!1271447 (= lt!574706 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28601))))

(declare-fun mapIsEmpty!51028 () Bool)

(assert (=> mapIsEmpty!51028 mapRes!51028))

(declare-fun b!1271448 () Bool)

(assert (=> b!1271448 (= e!725044 tp_is_empty!32965)))

(assert (= (and start!107276 res!845919) b!1271443))

(assert (= (and b!1271443 res!845921) b!1271446))

(assert (= (and b!1271446 res!845920) b!1271447))

(assert (= (and b!1271445 condMapEmpty!51028) mapIsEmpty!51028))

(assert (= (and b!1271445 (not condMapEmpty!51028)) mapNonEmpty!51028))

(get-info :version)

(assert (= (and mapNonEmpty!51028 ((_ is ValueCellFull!15629) mapValue!51028)) b!1271448))

(assert (= (and b!1271445 ((_ is ValueCellFull!15629) mapDefault!51028)) b!1271444))

(assert (= start!107276 b!1271445))

(declare-fun m!1168935 () Bool)

(assert (=> start!107276 m!1168935))

(declare-fun m!1168937 () Bool)

(assert (=> start!107276 m!1168937))

(declare-fun m!1168939 () Bool)

(assert (=> start!107276 m!1168939))

(declare-fun m!1168941 () Bool)

(assert (=> mapNonEmpty!51028 m!1168941))

(declare-fun m!1168943 () Bool)

(assert (=> b!1271446 m!1168943))

(declare-fun m!1168945 () Bool)

(assert (=> b!1271447 m!1168945))

(check-sat (not b!1271447) (not b!1271446) (not mapNonEmpty!51028) tp_is_empty!32965 (not start!107276))
(check-sat)
