; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83148 () Bool)

(assert start!83148)

(declare-fun b_free!19141 () Bool)

(declare-fun b_next!19141 () Bool)

(assert (=> start!83148 (= b_free!19141 (not b_next!19141))))

(declare-fun tp!66702 () Bool)

(declare-fun b_and!30629 () Bool)

(assert (=> start!83148 (= tp!66702 b_and!30629)))

(declare-fun mapIsEmpty!35068 () Bool)

(declare-fun mapRes!35068 () Bool)

(assert (=> mapIsEmpty!35068 mapRes!35068))

(declare-fun b!969998 () Bool)

(declare-fun res!649234 () Bool)

(declare-fun e!546859 () Bool)

(assert (=> b!969998 (=> (not res!649234) (not e!546859))))

(declare-datatypes ((array!60139 0))(
  ( (array!60140 (arr!28933 (Array (_ BitVec 32) (_ BitVec 64))) (size!29412 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60139)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60139 (_ BitVec 32)) Bool)

(assert (=> b!969998 (= res!649234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35068 () Bool)

(declare-fun tp!66701 () Bool)

(declare-fun e!546855 () Bool)

(assert (=> mapNonEmpty!35068 (= mapRes!35068 (and tp!66701 e!546855))))

(declare-datatypes ((V!34369 0))(
  ( (V!34370 (val!11070 Int)) )
))
(declare-datatypes ((ValueCell!10538 0))(
  ( (ValueCellFull!10538 (v!13629 V!34369)) (EmptyCell!10538) )
))
(declare-datatypes ((array!60141 0))(
  ( (array!60142 (arr!28934 (Array (_ BitVec 32) ValueCell!10538)) (size!29413 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60141)

(declare-fun mapRest!35068 () (Array (_ BitVec 32) ValueCell!10538))

(declare-fun mapValue!35068 () ValueCell!10538)

(declare-fun mapKey!35068 () (_ BitVec 32))

(assert (=> mapNonEmpty!35068 (= (arr!28934 _values!1425) (store mapRest!35068 mapKey!35068 mapValue!35068))))

(declare-fun b!969999 () Bool)

(assert (=> b!969999 (= e!546859 false)))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34369)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34369)

(declare-fun lt!431699 () Bool)

(declare-datatypes ((tuple2!14182 0))(
  ( (tuple2!14183 (_1!7102 (_ BitVec 64)) (_2!7102 V!34369)) )
))
(declare-datatypes ((List!20052 0))(
  ( (Nil!20049) (Cons!20048 (h!21210 tuple2!14182) (t!28415 List!20052)) )
))
(declare-datatypes ((ListLongMap!12879 0))(
  ( (ListLongMap!12880 (toList!6455 List!20052)) )
))
(declare-fun contains!5559 (ListLongMap!12879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3688 (array!60139 array!60141 (_ BitVec 32) (_ BitVec 32) V!34369 V!34369 (_ BitVec 32) Int) ListLongMap!12879)

(assert (=> b!969999 (= lt!431699 (contains!5559 (getCurrentListMap!3688 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28933 _keys!1717) i!822)))))

(declare-fun b!970000 () Bool)

(declare-fun res!649233 () Bool)

(assert (=> b!970000 (=> (not res!649233) (not e!546859))))

(declare-datatypes ((List!20053 0))(
  ( (Nil!20050) (Cons!20049 (h!21211 (_ BitVec 64)) (t!28416 List!20053)) )
))
(declare-fun arrayNoDuplicates!0 (array!60139 (_ BitVec 32) List!20053) Bool)

(assert (=> b!970000 (= res!649233 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20050))))

(declare-fun b!970001 () Bool)

(declare-fun res!649235 () Bool)

(assert (=> b!970001 (=> (not res!649235) (not e!546859))))

(assert (=> b!970001 (= res!649235 (and (= (size!29413 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29412 _keys!1717) (size!29413 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970002 () Bool)

(declare-fun e!546857 () Bool)

(declare-fun e!546858 () Bool)

(assert (=> b!970002 (= e!546857 (and e!546858 mapRes!35068))))

(declare-fun condMapEmpty!35068 () Bool)

(declare-fun mapDefault!35068 () ValueCell!10538)

