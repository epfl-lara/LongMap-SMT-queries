; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107146 () Bool)

(assert start!107146)

(declare-fun b!1270337 () Bool)

(declare-fun e!724094 () Bool)

(declare-fun e!724096 () Bool)

(declare-fun mapRes!50833 () Bool)

(assert (=> b!1270337 (= e!724094 (and e!724096 mapRes!50833))))

(declare-fun condMapEmpty!50833 () Bool)

(declare-datatypes ((V!48973 0))(
  ( (V!48974 (val!16492 Int)) )
))
(declare-datatypes ((ValueCell!15564 0))(
  ( (ValueCellFull!15564 (v!19129 V!48973)) (EmptyCell!15564) )
))
(declare-datatypes ((array!82932 0))(
  ( (array!82933 (arr!40003 (Array (_ BitVec 32) ValueCell!15564)) (size!40539 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82932)

(declare-fun mapDefault!50833 () ValueCell!15564)

(assert (=> b!1270337 (= condMapEmpty!50833 (= (arr!40003 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15564)) mapDefault!50833)))))

(declare-fun res!845362 () Bool)

(declare-fun e!724098 () Bool)

(assert (=> start!107146 (=> (not res!845362) (not e!724098))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107146 (= res!845362 (validMask!0 mask!1730))))

(assert (=> start!107146 e!724098))

(declare-fun array_inv!30427 (array!82932) Bool)

(assert (=> start!107146 (and (array_inv!30427 _values!1134) e!724094)))

(assert (=> start!107146 true))

(declare-datatypes ((array!82934 0))(
  ( (array!82935 (arr!40004 (Array (_ BitVec 32) (_ BitVec 64))) (size!40540 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82934)

(declare-fun array_inv!30428 (array!82934) Bool)

(assert (=> start!107146 (array_inv!30428 _keys!1364)))

(declare-fun b!1270338 () Bool)

(declare-fun e!724097 () Bool)

(declare-fun tp_is_empty!32835 () Bool)

(assert (=> b!1270338 (= e!724097 tp_is_empty!32835)))

(declare-fun b!1270339 () Bool)

(declare-fun res!845361 () Bool)

(assert (=> b!1270339 (=> (not res!845361) (not e!724098))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270339 (= res!845361 (and (= (size!40539 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40540 _keys!1364) (size!40539 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270340 () Bool)

(assert (=> b!1270340 (= e!724098 false)))

(declare-fun lt!574689 () Bool)

(declare-datatypes ((List!28483 0))(
  ( (Nil!28480) (Cons!28479 (h!29688 (_ BitVec 64)) (t!42012 List!28483)) )
))
(declare-fun arrayNoDuplicates!0 (array!82934 (_ BitVec 32) List!28483) Bool)

(assert (=> b!1270340 (= lt!574689 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28480))))

(declare-fun b!1270341 () Bool)

(declare-fun res!845363 () Bool)

(assert (=> b!1270341 (=> (not res!845363) (not e!724098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82934 (_ BitVec 32)) Bool)

(assert (=> b!1270341 (= res!845363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50833 () Bool)

(declare-fun tp!97174 () Bool)

(assert (=> mapNonEmpty!50833 (= mapRes!50833 (and tp!97174 e!724097))))

(declare-fun mapRest!50833 () (Array (_ BitVec 32) ValueCell!15564))

(declare-fun mapKey!50833 () (_ BitVec 32))

(declare-fun mapValue!50833 () ValueCell!15564)

(assert (=> mapNonEmpty!50833 (= (arr!40003 _values!1134) (store mapRest!50833 mapKey!50833 mapValue!50833))))

(declare-fun mapIsEmpty!50833 () Bool)

(assert (=> mapIsEmpty!50833 mapRes!50833))

(declare-fun b!1270342 () Bool)

(assert (=> b!1270342 (= e!724096 tp_is_empty!32835)))

(assert (= (and start!107146 res!845362) b!1270339))

(assert (= (and b!1270339 res!845361) b!1270341))

(assert (= (and b!1270341 res!845363) b!1270340))

(assert (= (and b!1270337 condMapEmpty!50833) mapIsEmpty!50833))

(assert (= (and b!1270337 (not condMapEmpty!50833)) mapNonEmpty!50833))

(get-info :version)

(assert (= (and mapNonEmpty!50833 ((_ is ValueCellFull!15564) mapValue!50833)) b!1270338))

(assert (= (and b!1270337 ((_ is ValueCellFull!15564) mapDefault!50833)) b!1270342))

(assert (= start!107146 b!1270337))

(declare-fun m!1168655 () Bool)

(assert (=> start!107146 m!1168655))

(declare-fun m!1168657 () Bool)

(assert (=> start!107146 m!1168657))

(declare-fun m!1168659 () Bool)

(assert (=> start!107146 m!1168659))

(declare-fun m!1168661 () Bool)

(assert (=> b!1270340 m!1168661))

(declare-fun m!1168663 () Bool)

(assert (=> b!1270341 m!1168663))

(declare-fun m!1168665 () Bool)

(assert (=> mapNonEmpty!50833 m!1168665))

(check-sat (not start!107146) (not b!1270341) (not b!1270340) tp_is_empty!32835 (not mapNonEmpty!50833))
(check-sat)
