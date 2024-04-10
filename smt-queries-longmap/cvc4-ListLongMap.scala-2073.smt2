; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35610 () Bool)

(assert start!35610)

(declare-fun mapNonEmpty!13602 () Bool)

(declare-fun mapRes!13602 () Bool)

(declare-fun tp!27579 () Bool)

(declare-fun e!218771 () Bool)

(assert (=> mapNonEmpty!13602 (= mapRes!13602 (and tp!27579 e!218771))))

(declare-datatypes ((V!11727 0))(
  ( (V!11728 (val!4076 Int)) )
))
(declare-datatypes ((ValueCell!3688 0))(
  ( (ValueCellFull!3688 (v!6270 V!11727)) (EmptyCell!3688) )
))
(declare-fun mapValue!13602 () ValueCell!3688)

(declare-datatypes ((array!19693 0))(
  ( (array!19694 (arr!9340 (Array (_ BitVec 32) ValueCell!3688)) (size!9692 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19693)

(declare-fun mapRest!13602 () (Array (_ BitVec 32) ValueCell!3688))

(declare-fun mapKey!13602 () (_ BitVec 32))

(assert (=> mapNonEmpty!13602 (= (arr!9340 _values!1208) (store mapRest!13602 mapKey!13602 mapValue!13602))))

(declare-fun b!357252 () Bool)

(declare-fun res!198378 () Bool)

(declare-fun e!218770 () Bool)

(assert (=> b!357252 (=> (not res!198378) (not e!218770))))

(declare-datatypes ((array!19695 0))(
  ( (array!19696 (arr!9341 (Array (_ BitVec 32) (_ BitVec 64))) (size!9693 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19695)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!357252 (= res!198378 (not (= (select (arr!9341 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357253 () Bool)

(declare-fun res!198372 () Bool)

(assert (=> b!357253 (=> (not res!198372) (not e!218770))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19695 (_ BitVec 32)) Bool)

(assert (=> b!357253 (= res!198372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!198374 () Bool)

(assert (=> start!35610 (=> (not res!198374) (not e!218770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35610 (= res!198374 (validMask!0 mask!1842))))

(assert (=> start!35610 e!218770))

(declare-fun tp_is_empty!8063 () Bool)

(assert (=> start!35610 tp_is_empty!8063))

(assert (=> start!35610 true))

(declare-fun array_inv!6864 (array!19695) Bool)

(assert (=> start!35610 (array_inv!6864 _keys!1456)))

(declare-fun e!218767 () Bool)

(declare-fun array_inv!6865 (array!19693) Bool)

(assert (=> start!35610 (and (array_inv!6865 _values!1208) e!218767)))

(declare-fun b!357254 () Bool)

(declare-fun res!198375 () Bool)

(assert (=> b!357254 (=> (not res!198375) (not e!218770))))

(declare-datatypes ((List!5388 0))(
  ( (Nil!5385) (Cons!5384 (h!6240 (_ BitVec 64)) (t!10538 List!5388)) )
))
(declare-fun arrayNoDuplicates!0 (array!19695 (_ BitVec 32) List!5388) Bool)

(assert (=> b!357254 (= res!198375 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5385))))

(declare-fun b!357255 () Bool)

(declare-fun res!198379 () Bool)

(assert (=> b!357255 (=> (not res!198379) (not e!218770))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!357255 (= res!198379 (and (= (size!9692 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9693 _keys!1456) (size!9692 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357256 () Bool)

(declare-fun res!198376 () Bool)

(assert (=> b!357256 (=> (not res!198376) (not e!218770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357256 (= res!198376 (validKeyInArray!0 k!1077))))

(declare-fun b!357257 () Bool)

(declare-fun res!198373 () Bool)

(assert (=> b!357257 (=> (not res!198373) (not e!218770))))

(declare-fun arrayContainsKey!0 (array!19695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357257 (= res!198373 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!357258 () Bool)

(assert (=> b!357258 (= e!218771 tp_is_empty!8063)))

(declare-fun b!357259 () Bool)

(declare-fun e!218769 () Bool)

(assert (=> b!357259 (= e!218767 (and e!218769 mapRes!13602))))

(declare-fun condMapEmpty!13602 () Bool)

(declare-fun mapDefault!13602 () ValueCell!3688)

