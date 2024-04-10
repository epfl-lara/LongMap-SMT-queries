; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107020 () Bool)

(assert start!107020)

(declare-fun res!844471 () Bool)

(declare-fun e!723149 () Bool)

(assert (=> start!107020 (=> (not res!844471) (not e!723149))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107020 (= res!844471 (validMask!0 mask!1730))))

(assert (=> start!107020 e!723149))

(declare-datatypes ((V!48805 0))(
  ( (V!48806 (val!16429 Int)) )
))
(declare-datatypes ((ValueCell!15501 0))(
  ( (ValueCellFull!15501 (v!19066 V!48805)) (EmptyCell!15501) )
))
(declare-datatypes ((array!82688 0))(
  ( (array!82689 (arr!39881 (Array (_ BitVec 32) ValueCell!15501)) (size!40417 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82688)

(declare-fun e!723153 () Bool)

(declare-fun array_inv!30345 (array!82688) Bool)

(assert (=> start!107020 (and (array_inv!30345 _values!1134) e!723153)))

(assert (=> start!107020 true))

(declare-datatypes ((array!82690 0))(
  ( (array!82691 (arr!39882 (Array (_ BitVec 32) (_ BitVec 64))) (size!40418 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82690)

(declare-fun array_inv!30346 (array!82690) Bool)

(assert (=> start!107020 (array_inv!30346 _keys!1364)))

(declare-fun b!1268879 () Bool)

(declare-fun e!723151 () Bool)

(declare-fun mapRes!50644 () Bool)

(assert (=> b!1268879 (= e!723153 (and e!723151 mapRes!50644))))

(declare-fun condMapEmpty!50644 () Bool)

(declare-fun mapDefault!50644 () ValueCell!15501)

(assert (=> b!1268879 (= condMapEmpty!50644 (= (arr!39881 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15501)) mapDefault!50644)))))

(declare-fun mapNonEmpty!50644 () Bool)

(declare-fun tp!96823 () Bool)

(declare-fun e!723150 () Bool)

(assert (=> mapNonEmpty!50644 (= mapRes!50644 (and tp!96823 e!723150))))

(declare-fun mapKey!50644 () (_ BitVec 32))

(declare-fun mapRest!50644 () (Array (_ BitVec 32) ValueCell!15501))

(declare-fun mapValue!50644 () ValueCell!15501)

(assert (=> mapNonEmpty!50644 (= (arr!39881 _values!1134) (store mapRest!50644 mapKey!50644 mapValue!50644))))

(declare-fun mapIsEmpty!50644 () Bool)

(assert (=> mapIsEmpty!50644 mapRes!50644))

(declare-fun b!1268880 () Bool)

(declare-fun res!844470 () Bool)

(assert (=> b!1268880 (=> (not res!844470) (not e!723149))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268880 (= res!844470 (and (= (size!40417 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40418 _keys!1364) (size!40417 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268881 () Bool)

(declare-fun tp_is_empty!32709 () Bool)

(assert (=> b!1268881 (= e!723150 tp_is_empty!32709)))

(declare-fun b!1268882 () Bool)

(assert (=> b!1268882 (= e!723149 false)))

(declare-fun lt!574500 () Bool)

(declare-datatypes ((List!28399 0))(
  ( (Nil!28396) (Cons!28395 (h!29604 (_ BitVec 64)) (t!41928 List!28399)) )
))
(declare-fun arrayNoDuplicates!0 (array!82690 (_ BitVec 32) List!28399) Bool)

(assert (=> b!1268882 (= lt!574500 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28396))))

(declare-fun b!1268883 () Bool)

(declare-fun res!844472 () Bool)

(assert (=> b!1268883 (=> (not res!844472) (not e!723149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82690 (_ BitVec 32)) Bool)

(assert (=> b!1268883 (= res!844472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268884 () Bool)

(assert (=> b!1268884 (= e!723151 tp_is_empty!32709)))

(assert (= (and start!107020 res!844471) b!1268880))

(assert (= (and b!1268880 res!844470) b!1268883))

(assert (= (and b!1268883 res!844472) b!1268882))

(assert (= (and b!1268879 condMapEmpty!50644) mapIsEmpty!50644))

(assert (= (and b!1268879 (not condMapEmpty!50644)) mapNonEmpty!50644))

(get-info :version)

(assert (= (and mapNonEmpty!50644 ((_ is ValueCellFull!15501) mapValue!50644)) b!1268881))

(assert (= (and b!1268879 ((_ is ValueCellFull!15501) mapDefault!50644)) b!1268884))

(assert (= start!107020 b!1268879))

(declare-fun m!1167575 () Bool)

(assert (=> start!107020 m!1167575))

(declare-fun m!1167577 () Bool)

(assert (=> start!107020 m!1167577))

(declare-fun m!1167579 () Bool)

(assert (=> start!107020 m!1167579))

(declare-fun m!1167581 () Bool)

(assert (=> mapNonEmpty!50644 m!1167581))

(declare-fun m!1167583 () Bool)

(assert (=> b!1268882 m!1167583))

(declare-fun m!1167585 () Bool)

(assert (=> b!1268883 m!1167585))

(check-sat (not b!1268882) tp_is_empty!32709 (not b!1268883) (not mapNonEmpty!50644) (not start!107020))
(check-sat)
