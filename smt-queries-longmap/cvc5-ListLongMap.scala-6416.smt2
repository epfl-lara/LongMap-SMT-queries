; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82292 () Bool)

(assert start!82292)

(declare-fun b_free!18565 () Bool)

(declare-fun b_next!18565 () Bool)

(assert (=> start!82292 (= b_free!18565 (not b_next!18565))))

(declare-fun tp!64656 () Bool)

(declare-fun b_and!30053 () Bool)

(assert (=> start!82292 (= tp!64656 b_and!30053)))

(declare-fun b!959362 () Bool)

(declare-fun e!540809 () Bool)

(declare-fun tp_is_empty!21271 () Bool)

(assert (=> b!959362 (= e!540809 tp_is_empty!21271)))

(declare-fun mapNonEmpty!33886 () Bool)

(declare-fun mapRes!33886 () Bool)

(declare-fun tp!64655 () Bool)

(assert (=> mapNonEmpty!33886 (= mapRes!33886 (and tp!64655 e!540809))))

(declare-fun mapKey!33886 () (_ BitVec 32))

(declare-datatypes ((V!33345 0))(
  ( (V!33346 (val!10686 Int)) )
))
(declare-datatypes ((ValueCell!10154 0))(
  ( (ValueCellFull!10154 (v!13243 V!33345)) (EmptyCell!10154) )
))
(declare-fun mapValue!33886 () ValueCell!10154)

(declare-datatypes ((array!58637 0))(
  ( (array!58638 (arr!28192 (Array (_ BitVec 32) ValueCell!10154)) (size!28671 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58637)

(declare-fun mapRest!33886 () (Array (_ BitVec 32) ValueCell!10154))

(assert (=> mapNonEmpty!33886 (= (arr!28192 _values!1386) (store mapRest!33886 mapKey!33886 mapValue!33886))))

(declare-fun b!959363 () Bool)

(declare-fun res!642183 () Bool)

(declare-fun e!540808 () Bool)

(assert (=> b!959363 (=> (not res!642183) (not e!540808))))

(declare-datatypes ((array!58639 0))(
  ( (array!58640 (arr!28193 (Array (_ BitVec 32) (_ BitVec 64))) (size!28672 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58639)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959363 (= res!642183 (validKeyInArray!0 (select (arr!28193 _keys!1668) i!793)))))

(declare-fun b!959364 () Bool)

(assert (=> b!959364 (= e!540808 (not true))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33345)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun zeroValue!1328 () V!33345)

(declare-fun defaultEntry!1389 () Int)

(declare-datatypes ((tuple2!13786 0))(
  ( (tuple2!13787 (_1!6904 (_ BitVec 64)) (_2!6904 V!33345)) )
))
(declare-datatypes ((List!19604 0))(
  ( (Nil!19601) (Cons!19600 (h!20762 tuple2!13786) (t!27967 List!19604)) )
))
(declare-datatypes ((ListLongMap!12483 0))(
  ( (ListLongMap!12484 (toList!6257 List!19604)) )
))
(declare-fun contains!5358 (ListLongMap!12483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3490 (array!58639 array!58637 (_ BitVec 32) (_ BitVec 32) V!33345 V!33345 (_ BitVec 32) Int) ListLongMap!12483)

(assert (=> b!959364 (contains!5358 (getCurrentListMap!3490 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28193 _keys!1668) i!793))))

(declare-datatypes ((Unit!32189 0))(
  ( (Unit!32190) )
))
(declare-fun lt!430539 () Unit!32189)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lemmaInListMapFromThenInFromSmaller!16 (array!58639 array!58637 (_ BitVec 32) (_ BitVec 32) V!33345 V!33345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32189)

(assert (=> b!959364 (= lt!430539 (lemmaInListMapFromThenInFromSmaller!16 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun mapIsEmpty!33886 () Bool)

(assert (=> mapIsEmpty!33886 mapRes!33886))

(declare-fun b!959365 () Bool)

(declare-fun res!642184 () Bool)

(assert (=> b!959365 (=> (not res!642184) (not e!540808))))

(declare-datatypes ((List!19605 0))(
  ( (Nil!19602) (Cons!19601 (h!20763 (_ BitVec 64)) (t!27968 List!19605)) )
))
(declare-fun arrayNoDuplicates!0 (array!58639 (_ BitVec 32) List!19605) Bool)

(assert (=> b!959365 (= res!642184 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19602))))

(declare-fun res!642179 () Bool)

(assert (=> start!82292 (=> (not res!642179) (not e!540808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82292 (= res!642179 (validMask!0 mask!2088))))

(assert (=> start!82292 e!540808))

(assert (=> start!82292 true))

(assert (=> start!82292 tp_is_empty!21271))

(declare-fun array_inv!21855 (array!58639) Bool)

(assert (=> start!82292 (array_inv!21855 _keys!1668)))

(declare-fun e!540810 () Bool)

(declare-fun array_inv!21856 (array!58637) Bool)

(assert (=> start!82292 (and (array_inv!21856 _values!1386) e!540810)))

(assert (=> start!82292 tp!64656))

(declare-fun b!959366 () Bool)

(declare-fun res!642182 () Bool)

(assert (=> b!959366 (=> (not res!642182) (not e!540808))))

(assert (=> b!959366 (= res!642182 (and (= (size!28671 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28672 _keys!1668) (size!28671 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959367 () Bool)

(declare-fun e!540807 () Bool)

(assert (=> b!959367 (= e!540810 (and e!540807 mapRes!33886))))

(declare-fun condMapEmpty!33886 () Bool)

(declare-fun mapDefault!33886 () ValueCell!10154)

