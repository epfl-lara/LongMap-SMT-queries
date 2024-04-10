; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20152 () Bool)

(assert start!20152)

(declare-fun b_free!4811 () Bool)

(declare-fun b_next!4811 () Bool)

(assert (=> start!20152 (= b_free!4811 (not b_next!4811))))

(declare-fun tp!17464 () Bool)

(declare-fun b_and!11557 () Bool)

(assert (=> start!20152 (= tp!17464 b_and!11557)))

(declare-fun b!197714 () Bool)

(declare-fun res!93581 () Bool)

(declare-fun e!130063 () Bool)

(assert (=> b!197714 (=> (not res!93581) (not e!130063))))

(declare-datatypes ((array!8587 0))(
  ( (array!8588 (arr!4044 (Array (_ BitVec 32) (_ BitVec 64))) (size!4369 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8587)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5869 0))(
  ( (V!5870 (val!2378 Int)) )
))
(declare-datatypes ((ValueCell!1990 0))(
  ( (ValueCellFull!1990 (v!4348 V!5869)) (EmptyCell!1990) )
))
(declare-datatypes ((array!8589 0))(
  ( (array!8590 (arr!4045 (Array (_ BitVec 32) ValueCell!1990)) (size!4370 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8589)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!197714 (= res!93581 (and (= (size!4370 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4369 _keys!825) (size!4370 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197715 () Bool)

(declare-fun res!93586 () Bool)

(assert (=> b!197715 (=> (not res!93586) (not e!130063))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197715 (= res!93586 (= (select (arr!4044 _keys!825) i!601) k!843))))

(declare-fun b!197716 () Bool)

(declare-fun res!93584 () Bool)

(assert (=> b!197716 (=> (not res!93584) (not e!130063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197716 (= res!93584 (validKeyInArray!0 k!843))))

(declare-fun b!197717 () Bool)

(declare-fun res!93585 () Bool)

(assert (=> b!197717 (=> (not res!93585) (not e!130063))))

(assert (=> b!197717 (= res!93585 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4369 _keys!825))))))

(declare-fun b!197718 () Bool)

(declare-fun res!93583 () Bool)

(assert (=> b!197718 (=> (not res!93583) (not e!130063))))

(declare-datatypes ((List!2526 0))(
  ( (Nil!2523) (Cons!2522 (h!3164 (_ BitVec 64)) (t!7457 List!2526)) )
))
(declare-fun arrayNoDuplicates!0 (array!8587 (_ BitVec 32) List!2526) Bool)

(assert (=> b!197718 (= res!93583 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2523))))

(declare-fun b!197719 () Bool)

(declare-fun e!130062 () Bool)

(declare-fun tp_is_empty!4667 () Bool)

(assert (=> b!197719 (= e!130062 tp_is_empty!4667)))

(declare-fun b!197720 () Bool)

(assert (=> b!197720 (= e!130063 false)))

(declare-datatypes ((tuple2!3612 0))(
  ( (tuple2!3613 (_1!1817 (_ BitVec 64)) (_2!1817 V!5869)) )
))
(declare-datatypes ((List!2527 0))(
  ( (Nil!2524) (Cons!2523 (h!3165 tuple2!3612) (t!7458 List!2527)) )
))
(declare-datatypes ((ListLongMap!2525 0))(
  ( (ListLongMap!2526 (toList!1278 List!2527)) )
))
(declare-fun lt!97772 () ListLongMap!2525)

(declare-fun v!520 () V!5869)

(declare-fun zeroValue!615 () V!5869)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5869)

(declare-fun getCurrentListMapNoExtraKeys!243 (array!8587 array!8589 (_ BitVec 32) (_ BitVec 32) V!5869 V!5869 (_ BitVec 32) Int) ListLongMap!2525)

(assert (=> b!197720 (= lt!97772 (getCurrentListMapNoExtraKeys!243 _keys!825 (array!8590 (store (arr!4045 _values!649) i!601 (ValueCellFull!1990 v!520)) (size!4370 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97773 () ListLongMap!2525)

(assert (=> b!197720 (= lt!97773 (getCurrentListMapNoExtraKeys!243 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!93580 () Bool)

(assert (=> start!20152 (=> (not res!93580) (not e!130063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20152 (= res!93580 (validMask!0 mask!1149))))

(assert (=> start!20152 e!130063))

(declare-fun e!130064 () Bool)

(declare-fun array_inv!2639 (array!8589) Bool)

(assert (=> start!20152 (and (array_inv!2639 _values!649) e!130064)))

(assert (=> start!20152 true))

(assert (=> start!20152 tp_is_empty!4667))

(declare-fun array_inv!2640 (array!8587) Bool)

(assert (=> start!20152 (array_inv!2640 _keys!825)))

(assert (=> start!20152 tp!17464))

(declare-fun mapNonEmpty!8069 () Bool)

(declare-fun mapRes!8069 () Bool)

(declare-fun tp!17465 () Bool)

(declare-fun e!130061 () Bool)

(assert (=> mapNonEmpty!8069 (= mapRes!8069 (and tp!17465 e!130061))))

(declare-fun mapRest!8069 () (Array (_ BitVec 32) ValueCell!1990))

(declare-fun mapKey!8069 () (_ BitVec 32))

(declare-fun mapValue!8069 () ValueCell!1990)

(assert (=> mapNonEmpty!8069 (= (arr!4045 _values!649) (store mapRest!8069 mapKey!8069 mapValue!8069))))

(declare-fun b!197721 () Bool)

(declare-fun res!93582 () Bool)

(assert (=> b!197721 (=> (not res!93582) (not e!130063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8587 (_ BitVec 32)) Bool)

(assert (=> b!197721 (= res!93582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197722 () Bool)

(assert (=> b!197722 (= e!130064 (and e!130062 mapRes!8069))))

(declare-fun condMapEmpty!8069 () Bool)

(declare-fun mapDefault!8069 () ValueCell!1990)

