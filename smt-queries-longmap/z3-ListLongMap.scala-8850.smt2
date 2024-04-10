; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107326 () Bool)

(assert start!107326)

(declare-fun b!1271971 () Bool)

(declare-fun e!725445 () Bool)

(declare-fun tp_is_empty!33015 () Bool)

(assert (=> b!1271971 (= e!725445 tp_is_empty!33015)))

(declare-fun mapNonEmpty!51103 () Bool)

(declare-fun mapRes!51103 () Bool)

(declare-fun tp!97444 () Bool)

(assert (=> mapNonEmpty!51103 (= mapRes!51103 (and tp!97444 e!725445))))

(declare-datatypes ((V!49213 0))(
  ( (V!49214 (val!16582 Int)) )
))
(declare-datatypes ((ValueCell!15654 0))(
  ( (ValueCellFull!15654 (v!19219 V!49213)) (EmptyCell!15654) )
))
(declare-datatypes ((array!83278 0))(
  ( (array!83279 (arr!40176 (Array (_ BitVec 32) ValueCell!15654)) (size!40712 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83278)

(declare-fun mapValue!51103 () ValueCell!15654)

(declare-fun mapRest!51103 () (Array (_ BitVec 32) ValueCell!15654))

(declare-fun mapKey!51103 () (_ BitVec 32))

(assert (=> mapNonEmpty!51103 (= (arr!40176 _values!1134) (store mapRest!51103 mapKey!51103 mapValue!51103))))

(declare-fun res!846186 () Bool)

(declare-fun e!725447 () Bool)

(assert (=> start!107326 (=> (not res!846186) (not e!725447))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107326 (= res!846186 (validMask!0 mask!1730))))

(assert (=> start!107326 e!725447))

(declare-fun e!725448 () Bool)

(declare-fun array_inv!30561 (array!83278) Bool)

(assert (=> start!107326 (and (array_inv!30561 _values!1134) e!725448)))

(assert (=> start!107326 true))

(declare-datatypes ((array!83280 0))(
  ( (array!83281 (arr!40177 (Array (_ BitVec 32) (_ BitVec 64))) (size!40713 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83280)

(declare-fun array_inv!30562 (array!83280) Bool)

(assert (=> start!107326 (array_inv!30562 _keys!1364)))

(declare-fun b!1271972 () Bool)

(declare-fun e!725446 () Bool)

(assert (=> b!1271972 (= e!725448 (and e!725446 mapRes!51103))))

(declare-fun condMapEmpty!51103 () Bool)

(declare-fun mapDefault!51103 () ValueCell!15654)

(assert (=> b!1271972 (= condMapEmpty!51103 (= (arr!40176 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15654)) mapDefault!51103)))))

(declare-fun b!1271973 () Bool)

(declare-fun res!846188 () Bool)

(assert (=> b!1271973 (=> (not res!846188) (not e!725447))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271973 (= res!846188 (and (= (size!40712 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40713 _keys!1364) (size!40712 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51103 () Bool)

(assert (=> mapIsEmpty!51103 mapRes!51103))

(declare-fun b!1271974 () Bool)

(assert (=> b!1271974 (= e!725446 tp_is_empty!33015)))

(declare-fun b!1271975 () Bool)

(declare-fun res!846185 () Bool)

(assert (=> b!1271975 (=> (not res!846185) (not e!725447))))

(declare-datatypes ((List!28547 0))(
  ( (Nil!28544) (Cons!28543 (h!29752 (_ BitVec 64)) (t!42076 List!28547)) )
))
(declare-fun arrayNoDuplicates!0 (array!83280 (_ BitVec 32) List!28547) Bool)

(assert (=> b!1271975 (= res!846185 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28544))))

(declare-fun b!1271976 () Bool)

(declare-fun res!846187 () Bool)

(assert (=> b!1271976 (=> (not res!846187) (not e!725447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83280 (_ BitVec 32)) Bool)

(assert (=> b!1271976 (= res!846187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271977 () Bool)

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1271977 (= e!725447 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40713 _keys!1364)) (bvslt from!1698 (size!40713 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000) (bvsge (bvsub (size!40713 _keys!1364) (bvadd #b00000000000000000000000000000001 from!1698)) (bvsub (size!40713 _keys!1364) from!1698))))))

(assert (= (and start!107326 res!846186) b!1271973))

(assert (= (and b!1271973 res!846188) b!1271976))

(assert (= (and b!1271976 res!846187) b!1271975))

(assert (= (and b!1271975 res!846185) b!1271977))

(assert (= (and b!1271972 condMapEmpty!51103) mapIsEmpty!51103))

(assert (= (and b!1271972 (not condMapEmpty!51103)) mapNonEmpty!51103))

(get-info :version)

(assert (= (and mapNonEmpty!51103 ((_ is ValueCellFull!15654) mapValue!51103)) b!1271971))

(assert (= (and b!1271972 ((_ is ValueCellFull!15654) mapDefault!51103)) b!1271974))

(assert (= start!107326 b!1271972))

(declare-fun m!1169735 () Bool)

(assert (=> mapNonEmpty!51103 m!1169735))

(declare-fun m!1169737 () Bool)

(assert (=> start!107326 m!1169737))

(declare-fun m!1169739 () Bool)

(assert (=> start!107326 m!1169739))

(declare-fun m!1169741 () Bool)

(assert (=> start!107326 m!1169741))

(declare-fun m!1169743 () Bool)

(assert (=> b!1271975 m!1169743))

(declare-fun m!1169745 () Bool)

(assert (=> b!1271976 m!1169745))

(check-sat (not start!107326) (not mapNonEmpty!51103) tp_is_empty!33015 (not b!1271976) (not b!1271975))
(check-sat)
