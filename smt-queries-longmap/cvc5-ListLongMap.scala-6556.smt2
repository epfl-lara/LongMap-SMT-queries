; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83220 () Bool)

(assert start!83220)

(declare-fun b_free!19213 () Bool)

(declare-fun b_next!19213 () Bool)

(assert (=> start!83220 (= b_free!19213 (not b_next!19213))))

(declare-fun tp!66917 () Bool)

(declare-fun b_and!30701 () Bool)

(assert (=> start!83220 (= tp!66917 b_and!30701)))

(declare-fun b!970999 () Bool)

(declare-fun e!547397 () Bool)

(declare-fun tp_is_empty!22111 () Bool)

(assert (=> b!970999 (= e!547397 tp_is_empty!22111)))

(declare-fun res!649913 () Bool)

(declare-fun e!547396 () Bool)

(assert (=> start!83220 (=> (not res!649913) (not e!547396))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83220 (= res!649913 (validMask!0 mask!2147))))

(assert (=> start!83220 e!547396))

(assert (=> start!83220 true))

(declare-datatypes ((V!34465 0))(
  ( (V!34466 (val!11106 Int)) )
))
(declare-datatypes ((ValueCell!10574 0))(
  ( (ValueCellFull!10574 (v!13665 V!34465)) (EmptyCell!10574) )
))
(declare-datatypes ((array!60275 0))(
  ( (array!60276 (arr!29001 (Array (_ BitVec 32) ValueCell!10574)) (size!29480 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60275)

(declare-fun e!547395 () Bool)

(declare-fun array_inv!22443 (array!60275) Bool)

(assert (=> start!83220 (and (array_inv!22443 _values!1425) e!547395)))

(assert (=> start!83220 tp_is_empty!22111))

(assert (=> start!83220 tp!66917))

(declare-datatypes ((array!60277 0))(
  ( (array!60278 (arr!29002 (Array (_ BitVec 32) (_ BitVec 64))) (size!29481 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60277)

(declare-fun array_inv!22444 (array!60277) Bool)

(assert (=> start!83220 (array_inv!22444 _keys!1717)))

(declare-fun b!971000 () Bool)

(declare-fun res!649909 () Bool)

(assert (=> b!971000 (=> (not res!649909) (not e!547396))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971000 (= res!649909 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29481 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29481 _keys!1717))))))

(declare-fun b!971001 () Bool)

(assert (=> b!971001 (= e!547396 false)))

(declare-datatypes ((tuple2!14232 0))(
  ( (tuple2!14233 (_1!7127 (_ BitVec 64)) (_2!7127 V!34465)) )
))
(declare-datatypes ((List!20101 0))(
  ( (Nil!20098) (Cons!20097 (h!21259 tuple2!14232) (t!28464 List!20101)) )
))
(declare-datatypes ((ListLongMap!12929 0))(
  ( (ListLongMap!12930 (toList!6480 List!20101)) )
))
(declare-fun lt!431789 () ListLongMap!12929)

(declare-fun zeroValue!1367 () V!34465)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34465)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3713 (array!60277 array!60275 (_ BitVec 32) (_ BitVec 32) V!34465 V!34465 (_ BitVec 32) Int) ListLongMap!12929)

(assert (=> b!971001 (= lt!431789 (getCurrentListMap!3713 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35176 () Bool)

(declare-fun mapRes!35176 () Bool)

(declare-fun tp!66918 () Bool)

(declare-fun e!547398 () Bool)

(assert (=> mapNonEmpty!35176 (= mapRes!35176 (and tp!66918 e!547398))))

(declare-fun mapKey!35176 () (_ BitVec 32))

(declare-fun mapValue!35176 () ValueCell!10574)

(declare-fun mapRest!35176 () (Array (_ BitVec 32) ValueCell!10574))

(assert (=> mapNonEmpty!35176 (= (arr!29001 _values!1425) (store mapRest!35176 mapKey!35176 mapValue!35176))))

(declare-fun b!971002 () Bool)

(declare-fun res!649908 () Bool)

(assert (=> b!971002 (=> (not res!649908) (not e!547396))))

(declare-datatypes ((List!20102 0))(
  ( (Nil!20099) (Cons!20098 (h!21260 (_ BitVec 64)) (t!28465 List!20102)) )
))
(declare-fun arrayNoDuplicates!0 (array!60277 (_ BitVec 32) List!20102) Bool)

(assert (=> b!971002 (= res!649908 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20099))))

(declare-fun mapIsEmpty!35176 () Bool)

(assert (=> mapIsEmpty!35176 mapRes!35176))

(declare-fun b!971003 () Bool)

(assert (=> b!971003 (= e!547395 (and e!547397 mapRes!35176))))

(declare-fun condMapEmpty!35176 () Bool)

(declare-fun mapDefault!35176 () ValueCell!10574)

