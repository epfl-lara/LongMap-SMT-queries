; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77614 () Bool)

(assert start!77614)

(declare-fun b_free!16199 () Bool)

(declare-fun b_next!16199 () Bool)

(assert (=> start!77614 (= b_free!16199 (not b_next!16199))))

(declare-fun tp!56858 () Bool)

(declare-fun b_and!26565 () Bool)

(assert (=> start!77614 (= tp!56858 b_and!26565)))

(declare-fun res!610391 () Bool)

(declare-fun e!506902 () Bool)

(assert (=> start!77614 (=> (not res!610391) (not e!506902))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77614 (= res!610391 (validMask!0 mask!1756))))

(assert (=> start!77614 e!506902))

(declare-datatypes ((V!29787 0))(
  ( (V!29788 (val!9359 Int)) )
))
(declare-datatypes ((ValueCell!8827 0))(
  ( (ValueCellFull!8827 (v!11864 V!29787)) (EmptyCell!8827) )
))
(declare-datatypes ((array!53278 0))(
  ( (array!53279 (arr!25598 (Array (_ BitVec 32) ValueCell!8827)) (size!26057 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53278)

(declare-fun e!506901 () Bool)

(declare-fun array_inv!20054 (array!53278) Bool)

(assert (=> start!77614 (and (array_inv!20054 _values!1152) e!506901)))

(assert (=> start!77614 tp!56858))

(assert (=> start!77614 true))

(declare-fun tp_is_empty!18617 () Bool)

(assert (=> start!77614 tp_is_empty!18617))

(declare-datatypes ((array!53280 0))(
  ( (array!53281 (arr!25599 (Array (_ BitVec 32) (_ BitVec 64))) (size!26058 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53280)

(declare-fun array_inv!20055 (array!53280) Bool)

(assert (=> start!77614 (array_inv!20055 _keys!1386)))

(declare-fun mapNonEmpty!29638 () Bool)

(declare-fun mapRes!29638 () Bool)

(declare-fun tp!56859 () Bool)

(declare-fun e!506905 () Bool)

(assert (=> mapNonEmpty!29638 (= mapRes!29638 (and tp!56859 e!506905))))

(declare-fun mapRest!29638 () (Array (_ BitVec 32) ValueCell!8827))

(declare-fun mapValue!29638 () ValueCell!8827)

(declare-fun mapKey!29638 () (_ BitVec 32))

(assert (=> mapNonEmpty!29638 (= (arr!25598 _values!1152) (store mapRest!29638 mapKey!29638 mapValue!29638))))

(declare-fun mapIsEmpty!29638 () Bool)

(assert (=> mapIsEmpty!29638 mapRes!29638))

(declare-fun b!904623 () Bool)

(declare-fun res!610393 () Bool)

(assert (=> b!904623 (=> (not res!610393) (not e!506902))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!904623 (= res!610393 (and (= (size!26057 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26058 _keys!1386) (size!26057 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904624 () Bool)

(declare-fun res!610397 () Bool)

(assert (=> b!904624 (=> (not res!610397) (not e!506902))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29787)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29787)

(declare-datatypes ((tuple2!12162 0))(
  ( (tuple2!12163 (_1!6092 (_ BitVec 64)) (_2!6092 V!29787)) )
))
(declare-datatypes ((List!17977 0))(
  ( (Nil!17974) (Cons!17973 (h!19119 tuple2!12162) (t!25360 List!17977)) )
))
(declare-datatypes ((ListLongMap!10859 0))(
  ( (ListLongMap!10860 (toList!5445 List!17977)) )
))
(declare-fun contains!4492 (ListLongMap!10859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2713 (array!53280 array!53278 (_ BitVec 32) (_ BitVec 32) V!29787 V!29787 (_ BitVec 32) Int) ListLongMap!10859)

(assert (=> b!904624 (= res!610397 (contains!4492 (getCurrentListMap!2713 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904625 () Bool)

(declare-fun e!506907 () Bool)

(assert (=> b!904625 (= e!506907 tp_is_empty!18617)))

(declare-fun b!904626 () Bool)

(assert (=> b!904626 (= e!506905 tp_is_empty!18617)))

(declare-fun b!904627 () Bool)

(declare-fun res!610389 () Bool)

(assert (=> b!904627 (=> (not res!610389) (not e!506902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53280 (_ BitVec 32)) Bool)

(assert (=> b!904627 (= res!610389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904628 () Bool)

(declare-fun e!506904 () Bool)

(declare-fun e!506906 () Bool)

(assert (=> b!904628 (= e!506904 e!506906)))

(declare-fun res!610395 () Bool)

(assert (=> b!904628 (=> res!610395 e!506906)))

(declare-fun lt!408281 () ListLongMap!10859)

(assert (=> b!904628 (= res!610395 (not (contains!4492 lt!408281 k!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904628 (= lt!408281 (getCurrentListMap!2713 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904629 () Bool)

(assert (=> b!904629 (= e!506902 (not e!506904))))

(declare-fun res!610396 () Bool)

(assert (=> b!904629 (=> res!610396 e!506904)))

(assert (=> b!904629 (= res!610396 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26058 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904629 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30684 0))(
  ( (Unit!30685) )
))
(declare-fun lt!408280 () Unit!30684)

(declare-fun lemmaKeyInListMapIsInArray!185 (array!53280 array!53278 (_ BitVec 32) (_ BitVec 32) V!29787 V!29787 (_ BitVec 64) Int) Unit!30684)

(assert (=> b!904629 (= lt!408280 (lemmaKeyInListMapIsInArray!185 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904630 () Bool)

(declare-fun res!610390 () Bool)

(assert (=> b!904630 (=> (not res!610390) (not e!506902))))

(assert (=> b!904630 (= res!610390 (and (= (select (arr!25599 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904631 () Bool)

(assert (=> b!904631 (= e!506901 (and e!506907 mapRes!29638))))

(declare-fun condMapEmpty!29638 () Bool)

(declare-fun mapDefault!29638 () ValueCell!8827)

