; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20188 () Bool)

(assert start!20188)

(declare-fun b_free!4847 () Bool)

(declare-fun b_next!4847 () Bool)

(assert (=> start!20188 (= b_free!4847 (not b_next!4847))))

(declare-fun tp!17572 () Bool)

(declare-fun b_and!11593 () Bool)

(assert (=> start!20188 (= tp!17572 b_and!11593)))

(declare-fun mapNonEmpty!8123 () Bool)

(declare-fun mapRes!8123 () Bool)

(declare-fun tp!17573 () Bool)

(declare-fun e!130330 () Bool)

(assert (=> mapNonEmpty!8123 (= mapRes!8123 (and tp!17573 e!130330))))

(declare-fun mapKey!8123 () (_ BitVec 32))

(declare-datatypes ((V!5917 0))(
  ( (V!5918 (val!2396 Int)) )
))
(declare-datatypes ((ValueCell!2008 0))(
  ( (ValueCellFull!2008 (v!4366 V!5917)) (EmptyCell!2008) )
))
(declare-datatypes ((array!8655 0))(
  ( (array!8656 (arr!4078 (Array (_ BitVec 32) ValueCell!2008)) (size!4403 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8655)

(declare-fun mapValue!8123 () ValueCell!2008)

(declare-fun mapRest!8123 () (Array (_ BitVec 32) ValueCell!2008))

(assert (=> mapNonEmpty!8123 (= (arr!4078 _values!649) (store mapRest!8123 mapKey!8123 mapValue!8123))))

(declare-fun b!198254 () Bool)

(declare-fun res!93959 () Bool)

(declare-fun e!130332 () Bool)

(assert (=> b!198254 (=> (not res!93959) (not e!130332))))

(declare-datatypes ((array!8657 0))(
  ( (array!8658 (arr!4079 (Array (_ BitVec 32) (_ BitVec 64))) (size!4404 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8657)

(declare-datatypes ((List!2549 0))(
  ( (Nil!2546) (Cons!2545 (h!3187 (_ BitVec 64)) (t!7480 List!2549)) )
))
(declare-fun arrayNoDuplicates!0 (array!8657 (_ BitVec 32) List!2549) Bool)

(assert (=> b!198254 (= res!93959 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2546))))

(declare-fun b!198255 () Bool)

(declare-fun res!93958 () Bool)

(assert (=> b!198255 (=> (not res!93958) (not e!130332))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198255 (= res!93958 (= (select (arr!4079 _keys!825) i!601) k!843))))

(declare-fun res!93962 () Bool)

(assert (=> start!20188 (=> (not res!93962) (not e!130332))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20188 (= res!93962 (validMask!0 mask!1149))))

(assert (=> start!20188 e!130332))

(declare-fun e!130334 () Bool)

(declare-fun array_inv!2667 (array!8655) Bool)

(assert (=> start!20188 (and (array_inv!2667 _values!649) e!130334)))

(assert (=> start!20188 true))

(declare-fun tp_is_empty!4703 () Bool)

(assert (=> start!20188 tp_is_empty!4703))

(declare-fun array_inv!2668 (array!8657) Bool)

(assert (=> start!20188 (array_inv!2668 _keys!825)))

(assert (=> start!20188 tp!17572))

(declare-fun b!198256 () Bool)

(declare-fun res!93963 () Bool)

(assert (=> b!198256 (=> (not res!93963) (not e!130332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8657 (_ BitVec 32)) Bool)

(assert (=> b!198256 (= res!93963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198257 () Bool)

(declare-fun res!93961 () Bool)

(assert (=> b!198257 (=> (not res!93961) (not e!130332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198257 (= res!93961 (validKeyInArray!0 k!843))))

(declare-fun b!198258 () Bool)

(assert (=> b!198258 (= e!130330 tp_is_empty!4703)))

(declare-fun b!198259 () Bool)

(declare-fun res!93960 () Bool)

(assert (=> b!198259 (=> (not res!93960) (not e!130332))))

(assert (=> b!198259 (= res!93960 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4404 _keys!825))))))

(declare-fun mapIsEmpty!8123 () Bool)

(assert (=> mapIsEmpty!8123 mapRes!8123))

(declare-fun b!198260 () Bool)

(assert (=> b!198260 (= e!130332 false)))

(declare-datatypes ((tuple2!3634 0))(
  ( (tuple2!3635 (_1!1828 (_ BitVec 64)) (_2!1828 V!5917)) )
))
(declare-datatypes ((List!2550 0))(
  ( (Nil!2547) (Cons!2546 (h!3188 tuple2!3634) (t!7481 List!2550)) )
))
(declare-datatypes ((ListLongMap!2547 0))(
  ( (ListLongMap!2548 (toList!1289 List!2550)) )
))
(declare-fun lt!97880 () ListLongMap!2547)

(declare-fun v!520 () V!5917)

(declare-fun zeroValue!615 () V!5917)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5917)

(declare-fun getCurrentListMapNoExtraKeys!254 (array!8657 array!8655 (_ BitVec 32) (_ BitVec 32) V!5917 V!5917 (_ BitVec 32) Int) ListLongMap!2547)

(assert (=> b!198260 (= lt!97880 (getCurrentListMapNoExtraKeys!254 _keys!825 (array!8656 (store (arr!4078 _values!649) i!601 (ValueCellFull!2008 v!520)) (size!4403 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97881 () ListLongMap!2547)

(assert (=> b!198260 (= lt!97881 (getCurrentListMapNoExtraKeys!254 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198261 () Bool)

(declare-fun e!130333 () Bool)

(assert (=> b!198261 (= e!130333 tp_is_empty!4703)))

(declare-fun b!198262 () Bool)

(declare-fun res!93964 () Bool)

(assert (=> b!198262 (=> (not res!93964) (not e!130332))))

(assert (=> b!198262 (= res!93964 (and (= (size!4403 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4404 _keys!825) (size!4403 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198263 () Bool)

(assert (=> b!198263 (= e!130334 (and e!130333 mapRes!8123))))

(declare-fun condMapEmpty!8123 () Bool)

(declare-fun mapDefault!8123 () ValueCell!2008)

