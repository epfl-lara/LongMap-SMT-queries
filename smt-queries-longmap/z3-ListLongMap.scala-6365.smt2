; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82094 () Bool)

(assert start!82094)

(declare-fun b_free!18421 () Bool)

(declare-fun b_next!18421 () Bool)

(assert (=> start!82094 (= b_free!18421 (not b_next!18421))))

(declare-fun tp!63963 () Bool)

(declare-fun b_and!29917 () Bool)

(assert (=> start!82094 (= tp!63963 b_and!29917)))

(declare-fun b!956520 () Bool)

(declare-fun res!640289 () Bool)

(declare-fun e!538927 () Bool)

(assert (=> b!956520 (=> (not res!640289) (not e!538927))))

(declare-datatypes ((array!58082 0))(
  ( (array!58083 (arr!27916 (Array (_ BitVec 32) (_ BitVec 64))) (size!28396 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58082)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58082 (_ BitVec 32)) Bool)

(assert (=> b!956520 (= res!640289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956521 () Bool)

(declare-fun res!640288 () Bool)

(assert (=> b!956521 (=> (not res!640288) (not e!538927))))

(declare-datatypes ((List!19448 0))(
  ( (Nil!19445) (Cons!19444 (h!20612 (_ BitVec 64)) (t!27801 List!19448)) )
))
(declare-fun arrayNoDuplicates!0 (array!58082 (_ BitVec 32) List!19448) Bool)

(assert (=> b!956521 (= res!640288 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19445))))

(declare-fun b!956522 () Bool)

(declare-fun e!538929 () Bool)

(declare-fun e!538928 () Bool)

(declare-fun mapRes!33409 () Bool)

(assert (=> b!956522 (= e!538929 (and e!538928 mapRes!33409))))

(declare-fun condMapEmpty!33409 () Bool)

(declare-datatypes ((V!32937 0))(
  ( (V!32938 (val!10533 Int)) )
))
(declare-datatypes ((ValueCell!10001 0))(
  ( (ValueCellFull!10001 (v!13085 V!32937)) (EmptyCell!10001) )
))
(declare-datatypes ((array!58084 0))(
  ( (array!58085 (arr!27917 (Array (_ BitVec 32) ValueCell!10001)) (size!28397 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58084)

(declare-fun mapDefault!33409 () ValueCell!10001)

(assert (=> b!956522 (= condMapEmpty!33409 (= (arr!27917 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10001)) mapDefault!33409)))))

(declare-fun b!956523 () Bool)

(declare-fun res!640285 () Bool)

(assert (=> b!956523 (=> (not res!640285) (not e!538927))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32937)

(declare-fun minValue!1139 () V!32937)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13666 0))(
  ( (tuple2!13667 (_1!6844 (_ BitVec 64)) (_2!6844 V!32937)) )
))
(declare-datatypes ((List!19449 0))(
  ( (Nil!19446) (Cons!19445 (h!20613 tuple2!13666) (t!27802 List!19449)) )
))
(declare-datatypes ((ListLongMap!12365 0))(
  ( (ListLongMap!12366 (toList!6198 List!19449)) )
))
(declare-fun contains!5307 (ListLongMap!12365 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3431 (array!58082 array!58084 (_ BitVec 32) (_ BitVec 32) V!32937 V!32937 (_ BitVec 32) Int) ListLongMap!12365)

(assert (=> b!956523 (= res!640285 (contains!5307 (getCurrentListMap!3431 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27916 _keys!1441) i!735)))))

(declare-fun mapNonEmpty!33409 () Bool)

(declare-fun tp!63964 () Bool)

(declare-fun e!538926 () Bool)

(assert (=> mapNonEmpty!33409 (= mapRes!33409 (and tp!63964 e!538926))))

(declare-fun mapKey!33409 () (_ BitVec 32))

(declare-fun mapValue!33409 () ValueCell!10001)

(declare-fun mapRest!33409 () (Array (_ BitVec 32) ValueCell!10001))

(assert (=> mapNonEmpty!33409 (= (arr!27917 _values!1197) (store mapRest!33409 mapKey!33409 mapValue!33409))))

(declare-fun b!956524 () Bool)

(declare-fun res!640287 () Bool)

(assert (=> b!956524 (=> (not res!640287) (not e!538927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956524 (= res!640287 (validKeyInArray!0 (select (arr!27916 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33409 () Bool)

(assert (=> mapIsEmpty!33409 mapRes!33409))

(declare-fun b!956525 () Bool)

(declare-fun tp_is_empty!20965 () Bool)

(assert (=> b!956525 (= e!538928 tp_is_empty!20965)))

(declare-fun res!640286 () Bool)

(assert (=> start!82094 (=> (not res!640286) (not e!538927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82094 (= res!640286 (validMask!0 mask!1823))))

(assert (=> start!82094 e!538927))

(assert (=> start!82094 true))

(assert (=> start!82094 tp_is_empty!20965))

(declare-fun array_inv!21739 (array!58082) Bool)

(assert (=> start!82094 (array_inv!21739 _keys!1441)))

(declare-fun array_inv!21740 (array!58084) Bool)

(assert (=> start!82094 (and (array_inv!21740 _values!1197) e!538929)))

(assert (=> start!82094 tp!63963))

(declare-fun b!956526 () Bool)

(assert (=> b!956526 (= e!538927 (not true))))

(assert (=> b!956526 (contains!5307 (getCurrentListMap!3431 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27916 _keys!1441) i!735))))

(declare-datatypes ((Unit!32098 0))(
  ( (Unit!32099) )
))
(declare-fun lt!430386 () Unit!32098)

(declare-fun lemmaInListMapFromThenFromZero!14 (array!58082 array!58084 (_ BitVec 32) (_ BitVec 32) V!32937 V!32937 (_ BitVec 32) (_ BitVec 32) Int) Unit!32098)

(assert (=> b!956526 (= lt!430386 (lemmaInListMapFromThenFromZero!14 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956527 () Bool)

(declare-fun res!640284 () Bool)

(assert (=> b!956527 (=> (not res!640284) (not e!538927))))

(assert (=> b!956527 (= res!640284 (and (= (size!28397 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28396 _keys!1441) (size!28397 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956528 () Bool)

(declare-fun res!640283 () Bool)

(assert (=> b!956528 (=> (not res!640283) (not e!538927))))

(assert (=> b!956528 (= res!640283 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28396 _keys!1441))))))

(declare-fun b!956529 () Bool)

(assert (=> b!956529 (= e!538926 tp_is_empty!20965)))

(assert (= (and start!82094 res!640286) b!956527))

(assert (= (and b!956527 res!640284) b!956520))

(assert (= (and b!956520 res!640289) b!956521))

(assert (= (and b!956521 res!640288) b!956528))

(assert (= (and b!956528 res!640283) b!956524))

(assert (= (and b!956524 res!640287) b!956523))

(assert (= (and b!956523 res!640285) b!956526))

(assert (= (and b!956522 condMapEmpty!33409) mapIsEmpty!33409))

(assert (= (and b!956522 (not condMapEmpty!33409)) mapNonEmpty!33409))

(get-info :version)

(assert (= (and mapNonEmpty!33409 ((_ is ValueCellFull!10001) mapValue!33409)) b!956529))

(assert (= (and b!956522 ((_ is ValueCellFull!10001) mapDefault!33409)) b!956525))

(assert (= start!82094 b!956522))

(declare-fun m!888405 () Bool)

(assert (=> b!956523 m!888405))

(declare-fun m!888407 () Bool)

(assert (=> b!956523 m!888407))

(assert (=> b!956523 m!888405))

(assert (=> b!956523 m!888407))

(declare-fun m!888409 () Bool)

(assert (=> b!956523 m!888409))

(declare-fun m!888411 () Bool)

(assert (=> start!82094 m!888411))

(declare-fun m!888413 () Bool)

(assert (=> start!82094 m!888413))

(declare-fun m!888415 () Bool)

(assert (=> start!82094 m!888415))

(declare-fun m!888417 () Bool)

(assert (=> mapNonEmpty!33409 m!888417))

(declare-fun m!888419 () Bool)

(assert (=> b!956521 m!888419))

(declare-fun m!888421 () Bool)

(assert (=> b!956520 m!888421))

(assert (=> b!956524 m!888407))

(assert (=> b!956524 m!888407))

(declare-fun m!888423 () Bool)

(assert (=> b!956524 m!888423))

(declare-fun m!888425 () Bool)

(assert (=> b!956526 m!888425))

(assert (=> b!956526 m!888407))

(assert (=> b!956526 m!888425))

(assert (=> b!956526 m!888407))

(declare-fun m!888427 () Bool)

(assert (=> b!956526 m!888427))

(declare-fun m!888429 () Bool)

(assert (=> b!956526 m!888429))

(check-sat (not b!956521) tp_is_empty!20965 (not b!956520) (not start!82094) (not b_next!18421) (not b!956524) b_and!29917 (not mapNonEmpty!33409) (not b!956526) (not b!956523))
(check-sat b_and!29917 (not b_next!18421))
