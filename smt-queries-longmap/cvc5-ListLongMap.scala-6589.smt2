; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83418 () Bool)

(assert start!83418)

(declare-fun b_free!19411 () Bool)

(declare-fun b_next!19411 () Bool)

(assert (=> start!83418 (= b_free!19411 (not b_next!19411))))

(declare-fun tp!67512 () Bool)

(declare-fun b_and!31013 () Bool)

(assert (=> start!83418 (= tp!67512 b_and!31013)))

(declare-fun b!974254 () Bool)

(declare-fun res!652162 () Bool)

(declare-fun e!549134 () Bool)

(assert (=> b!974254 (=> (not res!652162) (not e!549134))))

(declare-datatypes ((array!60659 0))(
  ( (array!60660 (arr!29193 (Array (_ BitVec 32) (_ BitVec 64))) (size!29672 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60659)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60659 (_ BitVec 32)) Bool)

(assert (=> b!974254 (= res!652162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974255 () Bool)

(assert (=> b!974255 (= e!549134 false)))

(declare-datatypes ((V!34729 0))(
  ( (V!34730 (val!11205 Int)) )
))
(declare-datatypes ((tuple2!14400 0))(
  ( (tuple2!14401 (_1!7211 (_ BitVec 64)) (_2!7211 V!34729)) )
))
(declare-datatypes ((List!20255 0))(
  ( (Nil!20252) (Cons!20251 (h!21413 tuple2!14400) (t!28732 List!20255)) )
))
(declare-datatypes ((ListLongMap!13097 0))(
  ( (ListLongMap!13098 (toList!6564 List!20255)) )
))
(declare-fun lt!432752 () ListLongMap!13097)

(declare-datatypes ((ValueCell!10673 0))(
  ( (ValueCellFull!10673 (v!13764 V!34729)) (EmptyCell!10673) )
))
(declare-datatypes ((array!60661 0))(
  ( (array!60662 (arr!29194 (Array (_ BitVec 32) ValueCell!10673)) (size!29673 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60661)

(declare-fun zeroValue!1367 () V!34729)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34729)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3797 (array!60659 array!60661 (_ BitVec 32) (_ BitVec 32) V!34729 V!34729 (_ BitVec 32) Int) ListLongMap!13097)

(assert (=> b!974255 (= lt!432752 (getCurrentListMap!3797 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974256 () Bool)

(declare-fun e!549135 () Bool)

(declare-fun tp_is_empty!22309 () Bool)

(assert (=> b!974256 (= e!549135 tp_is_empty!22309)))

(declare-fun res!652158 () Bool)

(assert (=> start!83418 (=> (not res!652158) (not e!549134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83418 (= res!652158 (validMask!0 mask!2147))))

(assert (=> start!83418 e!549134))

(assert (=> start!83418 true))

(declare-fun e!549132 () Bool)

(declare-fun array_inv!22577 (array!60661) Bool)

(assert (=> start!83418 (and (array_inv!22577 _values!1425) e!549132)))

(assert (=> start!83418 tp_is_empty!22309))

(assert (=> start!83418 tp!67512))

(declare-fun array_inv!22578 (array!60659) Bool)

(assert (=> start!83418 (array_inv!22578 _keys!1717)))

(declare-fun mapIsEmpty!35473 () Bool)

(declare-fun mapRes!35473 () Bool)

(assert (=> mapIsEmpty!35473 mapRes!35473))

(declare-fun b!974257 () Bool)

(declare-fun res!652160 () Bool)

(assert (=> b!974257 (=> (not res!652160) (not e!549134))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974257 (= res!652160 (validKeyInArray!0 (select (arr!29193 _keys!1717) i!822)))))

(declare-fun b!974258 () Bool)

(declare-fun e!549133 () Bool)

(assert (=> b!974258 (= e!549132 (and e!549133 mapRes!35473))))

(declare-fun condMapEmpty!35473 () Bool)

(declare-fun mapDefault!35473 () ValueCell!10673)

