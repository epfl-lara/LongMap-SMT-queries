; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107320 () Bool)

(assert start!107320)

(declare-fun b!1271908 () Bool)

(declare-fun e!725399 () Bool)

(declare-fun tp_is_empty!33009 () Bool)

(assert (=> b!1271908 (= e!725399 tp_is_empty!33009)))

(declare-fun res!846149 () Bool)

(declare-fun e!725400 () Bool)

(assert (=> start!107320 (=> (not res!846149) (not e!725400))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107320 (= res!846149 (validMask!0 mask!1730))))

(assert (=> start!107320 e!725400))

(declare-datatypes ((V!49205 0))(
  ( (V!49206 (val!16579 Int)) )
))
(declare-datatypes ((ValueCell!15651 0))(
  ( (ValueCellFull!15651 (v!19216 V!49205)) (EmptyCell!15651) )
))
(declare-datatypes ((array!83266 0))(
  ( (array!83267 (arr!40170 (Array (_ BitVec 32) ValueCell!15651)) (size!40706 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83266)

(declare-fun e!725401 () Bool)

(declare-fun array_inv!30555 (array!83266) Bool)

(assert (=> start!107320 (and (array_inv!30555 _values!1134) e!725401)))

(assert (=> start!107320 true))

(declare-datatypes ((array!83268 0))(
  ( (array!83269 (arr!40171 (Array (_ BitVec 32) (_ BitVec 64))) (size!40707 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83268)

(declare-fun array_inv!30556 (array!83268) Bool)

(assert (=> start!107320 (array_inv!30556 _keys!1364)))

(declare-fun b!1271909 () Bool)

(declare-fun res!846150 () Bool)

(assert (=> b!1271909 (=> (not res!846150) (not e!725400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83268 (_ BitVec 32)) Bool)

(assert (=> b!1271909 (= res!846150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271910 () Bool)

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1271910 (= e!725400 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40707 _keys!1364)) (bvslt from!1698 (size!40707 _keys!1364)) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271911 () Bool)

(declare-fun res!846151 () Bool)

(assert (=> b!1271911 (=> (not res!846151) (not e!725400))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271911 (= res!846151 (and (= (size!40706 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40707 _keys!1364) (size!40706 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271912 () Bool)

(declare-fun mapRes!51094 () Bool)

(assert (=> b!1271912 (= e!725401 (and e!725399 mapRes!51094))))

(declare-fun condMapEmpty!51094 () Bool)

(declare-fun mapDefault!51094 () ValueCell!15651)

(assert (=> b!1271912 (= condMapEmpty!51094 (= (arr!40170 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15651)) mapDefault!51094)))))

(declare-fun b!1271913 () Bool)

(declare-fun res!846152 () Bool)

(assert (=> b!1271913 (=> (not res!846152) (not e!725400))))

(declare-datatypes ((List!28544 0))(
  ( (Nil!28541) (Cons!28540 (h!29749 (_ BitVec 64)) (t!42073 List!28544)) )
))
(declare-fun arrayNoDuplicates!0 (array!83268 (_ BitVec 32) List!28544) Bool)

(assert (=> b!1271913 (= res!846152 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28541))))

(declare-fun mapNonEmpty!51094 () Bool)

(declare-fun tp!97435 () Bool)

(declare-fun e!725403 () Bool)

(assert (=> mapNonEmpty!51094 (= mapRes!51094 (and tp!97435 e!725403))))

(declare-fun mapKey!51094 () (_ BitVec 32))

(declare-fun mapRest!51094 () (Array (_ BitVec 32) ValueCell!15651))

(declare-fun mapValue!51094 () ValueCell!15651)

(assert (=> mapNonEmpty!51094 (= (arr!40170 _values!1134) (store mapRest!51094 mapKey!51094 mapValue!51094))))

(declare-fun b!1271914 () Bool)

(assert (=> b!1271914 (= e!725403 tp_is_empty!33009)))

(declare-fun mapIsEmpty!51094 () Bool)

(assert (=> mapIsEmpty!51094 mapRes!51094))

(assert (= (and start!107320 res!846149) b!1271911))

(assert (= (and b!1271911 res!846151) b!1271909))

(assert (= (and b!1271909 res!846150) b!1271913))

(assert (= (and b!1271913 res!846152) b!1271910))

(assert (= (and b!1271912 condMapEmpty!51094) mapIsEmpty!51094))

(assert (= (and b!1271912 (not condMapEmpty!51094)) mapNonEmpty!51094))

(get-info :version)

(assert (= (and mapNonEmpty!51094 ((_ is ValueCellFull!15651) mapValue!51094)) b!1271914))

(assert (= (and b!1271912 ((_ is ValueCellFull!15651) mapDefault!51094)) b!1271908))

(assert (= start!107320 b!1271912))

(declare-fun m!1169699 () Bool)

(assert (=> start!107320 m!1169699))

(declare-fun m!1169701 () Bool)

(assert (=> start!107320 m!1169701))

(declare-fun m!1169703 () Bool)

(assert (=> start!107320 m!1169703))

(declare-fun m!1169705 () Bool)

(assert (=> b!1271909 m!1169705))

(declare-fun m!1169707 () Bool)

(assert (=> b!1271913 m!1169707))

(declare-fun m!1169709 () Bool)

(assert (=> mapNonEmpty!51094 m!1169709))

(check-sat (not b!1271909) (not b!1271913) (not mapNonEmpty!51094) (not start!107320) tp_is_empty!33009)
(check-sat)
