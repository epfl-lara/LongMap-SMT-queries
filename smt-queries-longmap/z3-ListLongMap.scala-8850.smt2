; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107324 () Bool)

(assert start!107324)

(declare-fun b!1271886 () Bool)

(declare-fun e!725400 () Bool)

(declare-fun e!725403 () Bool)

(declare-fun mapRes!51100 () Bool)

(assert (=> b!1271886 (= e!725400 (and e!725403 mapRes!51100))))

(declare-fun condMapEmpty!51100 () Bool)

(declare-datatypes ((V!49211 0))(
  ( (V!49212 (val!16581 Int)) )
))
(declare-datatypes ((ValueCell!15653 0))(
  ( (ValueCellFull!15653 (v!19217 V!49211)) (EmptyCell!15653) )
))
(declare-datatypes ((array!83175 0))(
  ( (array!83176 (arr!40125 (Array (_ BitVec 32) ValueCell!15653)) (size!40663 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83175)

(declare-fun mapDefault!51100 () ValueCell!15653)

(assert (=> b!1271886 (= condMapEmpty!51100 (= (arr!40125 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15653)) mapDefault!51100)))))

(declare-fun b!1271887 () Bool)

(declare-fun tp_is_empty!33013 () Bool)

(assert (=> b!1271887 (= e!725403 tp_is_empty!33013)))

(declare-fun b!1271888 () Bool)

(declare-fun res!846147 () Bool)

(declare-fun e!725401 () Bool)

(assert (=> b!1271888 (=> (not res!846147) (not e!725401))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83177 0))(
  ( (array!83178 (arr!40126 (Array (_ BitVec 32) (_ BitVec 64))) (size!40664 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83177)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271888 (= res!846147 (and (= (size!40663 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40664 _keys!1364) (size!40663 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271889 () Bool)

(declare-fun res!846148 () Bool)

(assert (=> b!1271889 (=> (not res!846148) (not e!725401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83177 (_ BitVec 32)) Bool)

(assert (=> b!1271889 (= res!846148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!51100 () Bool)

(declare-fun tp!97442 () Bool)

(declare-fun e!725404 () Bool)

(assert (=> mapNonEmpty!51100 (= mapRes!51100 (and tp!97442 e!725404))))

(declare-fun mapKey!51100 () (_ BitVec 32))

(declare-fun mapValue!51100 () ValueCell!15653)

(declare-fun mapRest!51100 () (Array (_ BitVec 32) ValueCell!15653))

(assert (=> mapNonEmpty!51100 (= (arr!40125 _values!1134) (store mapRest!51100 mapKey!51100 mapValue!51100))))

(declare-fun res!846146 () Bool)

(assert (=> start!107324 (=> (not res!846146) (not e!725401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107324 (= res!846146 (validMask!0 mask!1730))))

(assert (=> start!107324 e!725401))

(declare-fun array_inv!30669 (array!83175) Bool)

(assert (=> start!107324 (and (array_inv!30669 _values!1134) e!725400)))

(assert (=> start!107324 true))

(declare-fun array_inv!30670 (array!83177) Bool)

(assert (=> start!107324 (array_inv!30670 _keys!1364)))

(declare-fun b!1271890 () Bool)

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1271890 (= e!725401 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40664 _keys!1364)) (bvslt from!1698 (size!40664 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvsge (bvsub (size!40664 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (bvsub (size!40664 _keys!1364) from!1698))))))

(declare-fun mapIsEmpty!51100 () Bool)

(assert (=> mapIsEmpty!51100 mapRes!51100))

(declare-fun b!1271891 () Bool)

(declare-fun res!846149 () Bool)

(assert (=> b!1271891 (=> (not res!846149) (not e!725401))))

(declare-datatypes ((List!28619 0))(
  ( (Nil!28616) (Cons!28615 (h!29824 (_ BitVec 64)) (t!42140 List!28619)) )
))
(declare-fun arrayNoDuplicates!0 (array!83177 (_ BitVec 32) List!28619) Bool)

(assert (=> b!1271891 (= res!846149 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28616))))

(declare-fun b!1271892 () Bool)

(assert (=> b!1271892 (= e!725404 tp_is_empty!33013)))

(assert (= (and start!107324 res!846146) b!1271888))

(assert (= (and b!1271888 res!846147) b!1271889))

(assert (= (and b!1271889 res!846148) b!1271891))

(assert (= (and b!1271891 res!846149) b!1271890))

(assert (= (and b!1271886 condMapEmpty!51100) mapIsEmpty!51100))

(assert (= (and b!1271886 (not condMapEmpty!51100)) mapNonEmpty!51100))

(get-info :version)

(assert (= (and mapNonEmpty!51100 ((_ is ValueCellFull!15653) mapValue!51100)) b!1271892))

(assert (= (and b!1271886 ((_ is ValueCellFull!15653) mapDefault!51100)) b!1271887))

(assert (= start!107324 b!1271886))

(declare-fun m!1169223 () Bool)

(assert (=> b!1271889 m!1169223))

(declare-fun m!1169225 () Bool)

(assert (=> mapNonEmpty!51100 m!1169225))

(declare-fun m!1169227 () Bool)

(assert (=> start!107324 m!1169227))

(declare-fun m!1169229 () Bool)

(assert (=> start!107324 m!1169229))

(declare-fun m!1169231 () Bool)

(assert (=> start!107324 m!1169231))

(declare-fun m!1169233 () Bool)

(assert (=> b!1271891 m!1169233))

(check-sat (not start!107324) (not b!1271889) (not b!1271891) (not mapNonEmpty!51100) tp_is_empty!33013)
(check-sat)
