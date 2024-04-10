; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107248 () Bool)

(assert start!107248)

(declare-fun b!1271255 () Bool)

(declare-fun e!724860 () Bool)

(declare-fun e!724862 () Bool)

(declare-fun mapRes!50986 () Bool)

(assert (=> b!1271255 (= e!724860 (and e!724862 mapRes!50986))))

(declare-fun condMapEmpty!50986 () Bool)

(declare-datatypes ((V!49109 0))(
  ( (V!49110 (val!16543 Int)) )
))
(declare-datatypes ((ValueCell!15615 0))(
  ( (ValueCellFull!15615 (v!19180 V!49109)) (EmptyCell!15615) )
))
(declare-datatypes ((array!83126 0))(
  ( (array!83127 (arr!40100 (Array (_ BitVec 32) ValueCell!15615)) (size!40636 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83126)

(declare-fun mapDefault!50986 () ValueCell!15615)

(assert (=> b!1271255 (= condMapEmpty!50986 (= (arr!40100 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15615)) mapDefault!50986)))))

(declare-fun b!1271257 () Bool)

(declare-fun res!845820 () Bool)

(declare-fun e!724861 () Bool)

(assert (=> b!1271257 (=> (not res!845820) (not e!724861))))

(declare-datatypes ((array!83128 0))(
  ( (array!83129 (arr!40101 (Array (_ BitVec 32) (_ BitVec 64))) (size!40637 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83128)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83128 (_ BitVec 32)) Bool)

(assert (=> b!1271257 (= res!845820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271258 () Bool)

(declare-fun e!724863 () Bool)

(declare-fun tp_is_empty!32937 () Bool)

(assert (=> b!1271258 (= e!724863 tp_is_empty!32937)))

(declare-fun mapIsEmpty!50986 () Bool)

(assert (=> mapIsEmpty!50986 mapRes!50986))

(declare-fun mapNonEmpty!50986 () Bool)

(declare-fun tp!97327 () Bool)

(assert (=> mapNonEmpty!50986 (= mapRes!50986 (and tp!97327 e!724863))))

(declare-fun mapKey!50986 () (_ BitVec 32))

(declare-fun mapValue!50986 () ValueCell!15615)

(declare-fun mapRest!50986 () (Array (_ BitVec 32) ValueCell!15615))

(assert (=> mapNonEmpty!50986 (= (arr!40100 _values!1134) (store mapRest!50986 mapKey!50986 mapValue!50986))))

(declare-fun b!1271259 () Bool)

(assert (=> b!1271259 (= e!724862 tp_is_empty!32937)))

(declare-fun b!1271260 () Bool)

(declare-fun res!845821 () Bool)

(assert (=> b!1271260 (=> (not res!845821) (not e!724861))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271260 (= res!845821 (and (= (size!40636 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40637 _keys!1364) (size!40636 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845822 () Bool)

(assert (=> start!107248 (=> (not res!845822) (not e!724861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107248 (= res!845822 (validMask!0 mask!1730))))

(assert (=> start!107248 e!724861))

(declare-fun array_inv!30499 (array!83126) Bool)

(assert (=> start!107248 (and (array_inv!30499 _values!1134) e!724860)))

(assert (=> start!107248 true))

(declare-fun array_inv!30500 (array!83128) Bool)

(assert (=> start!107248 (array_inv!30500 _keys!1364)))

(declare-fun b!1271256 () Bool)

(assert (=> b!1271256 (= e!724861 false)))

(declare-fun lt!574842 () Bool)

(declare-datatypes ((List!28517 0))(
  ( (Nil!28514) (Cons!28513 (h!29722 (_ BitVec 64)) (t!42046 List!28517)) )
))
(declare-fun arrayNoDuplicates!0 (array!83128 (_ BitVec 32) List!28517) Bool)

(assert (=> b!1271256 (= lt!574842 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28514))))

(assert (= (and start!107248 res!845822) b!1271260))

(assert (= (and b!1271260 res!845821) b!1271257))

(assert (= (and b!1271257 res!845820) b!1271256))

(assert (= (and b!1271255 condMapEmpty!50986) mapIsEmpty!50986))

(assert (= (and b!1271255 (not condMapEmpty!50986)) mapNonEmpty!50986))

(get-info :version)

(assert (= (and mapNonEmpty!50986 ((_ is ValueCellFull!15615) mapValue!50986)) b!1271258))

(assert (= (and b!1271255 ((_ is ValueCellFull!15615) mapDefault!50986)) b!1271259))

(assert (= start!107248 b!1271255))

(declare-fun m!1169267 () Bool)

(assert (=> b!1271257 m!1169267))

(declare-fun m!1169269 () Bool)

(assert (=> mapNonEmpty!50986 m!1169269))

(declare-fun m!1169271 () Bool)

(assert (=> start!107248 m!1169271))

(declare-fun m!1169273 () Bool)

(assert (=> start!107248 m!1169273))

(declare-fun m!1169275 () Bool)

(assert (=> start!107248 m!1169275))

(declare-fun m!1169277 () Bool)

(assert (=> b!1271256 m!1169277))

(check-sat (not mapNonEmpty!50986) (not b!1271256) tp_is_empty!32937 (not start!107248) (not b!1271257))
(check-sat)
