; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83446 () Bool)

(assert start!83446)

(declare-fun b!974659 () Bool)

(declare-fun e!549354 () Bool)

(declare-fun tp_is_empty!22337 () Bool)

(assert (=> b!974659 (= e!549354 tp_is_empty!22337)))

(declare-fun b!974660 () Bool)

(declare-fun e!549353 () Bool)

(declare-datatypes ((array!60713 0))(
  ( (array!60714 (arr!29220 (Array (_ BitVec 32) (_ BitVec 64))) (size!29699 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60713)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974660 (= e!549353 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29699 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29699 _keys!1717)) (bvslt i!822 #b00000000000000000000000000000000)))))

(declare-fun res!652440 () Bool)

(assert (=> start!83446 (=> (not res!652440) (not e!549353))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83446 (= res!652440 (validMask!0 mask!2147))))

(assert (=> start!83446 e!549353))

(assert (=> start!83446 true))

(declare-datatypes ((V!34765 0))(
  ( (V!34766 (val!11219 Int)) )
))
(declare-datatypes ((ValueCell!10687 0))(
  ( (ValueCellFull!10687 (v!13778 V!34765)) (EmptyCell!10687) )
))
(declare-datatypes ((array!60715 0))(
  ( (array!60716 (arr!29221 (Array (_ BitVec 32) ValueCell!10687)) (size!29700 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60715)

(declare-fun e!549355 () Bool)

(declare-fun array_inv!22599 (array!60715) Bool)

(assert (=> start!83446 (and (array_inv!22599 _values!1425) e!549355)))

(declare-fun array_inv!22600 (array!60713) Bool)

(assert (=> start!83446 (array_inv!22600 _keys!1717)))

(declare-fun b!974661 () Bool)

(declare-fun res!652437 () Bool)

(assert (=> b!974661 (=> (not res!652437) (not e!549353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60713 (_ BitVec 32)) Bool)

(assert (=> b!974661 (= res!652437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974662 () Bool)

(declare-fun res!652438 () Bool)

(assert (=> b!974662 (=> (not res!652438) (not e!549353))))

(declare-datatypes ((List!20275 0))(
  ( (Nil!20272) (Cons!20271 (h!21433 (_ BitVec 64)) (t!28752 List!20275)) )
))
(declare-fun arrayNoDuplicates!0 (array!60713 (_ BitVec 32) List!20275) Bool)

(assert (=> b!974662 (= res!652438 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20272))))

(declare-fun mapNonEmpty!35515 () Bool)

(declare-fun mapRes!35515 () Bool)

(declare-fun tp!67587 () Bool)

(assert (=> mapNonEmpty!35515 (= mapRes!35515 (and tp!67587 e!549354))))

(declare-fun mapKey!35515 () (_ BitVec 32))

(declare-fun mapValue!35515 () ValueCell!10687)

(declare-fun mapRest!35515 () (Array (_ BitVec 32) ValueCell!10687))

(assert (=> mapNonEmpty!35515 (= (arr!29221 _values!1425) (store mapRest!35515 mapKey!35515 mapValue!35515))))

(declare-fun b!974663 () Bool)

(declare-fun e!549351 () Bool)

(assert (=> b!974663 (= e!549351 tp_is_empty!22337)))

(declare-fun b!974664 () Bool)

(assert (=> b!974664 (= e!549355 (and e!549351 mapRes!35515))))

(declare-fun condMapEmpty!35515 () Bool)

(declare-fun mapDefault!35515 () ValueCell!10687)

