; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83136 () Bool)

(assert start!83136)

(declare-fun b_free!19129 () Bool)

(declare-fun b_next!19129 () Bool)

(assert (=> start!83136 (= b_free!19129 (not b_next!19129))))

(declare-fun tp!66666 () Bool)

(declare-fun b_and!30617 () Bool)

(assert (=> start!83136 (= tp!66666 b_and!30617)))

(declare-fun mapIsEmpty!35050 () Bool)

(declare-fun mapRes!35050 () Bool)

(assert (=> mapIsEmpty!35050 mapRes!35050))

(declare-fun b!969836 () Bool)

(declare-fun e!546768 () Bool)

(declare-fun tp_is_empty!22027 () Bool)

(assert (=> b!969836 (= e!546768 tp_is_empty!22027)))

(declare-fun b!969837 () Bool)

(declare-fun res!649127 () Bool)

(declare-fun e!546767 () Bool)

(assert (=> b!969837 (=> (not res!649127) (not e!546767))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((array!60115 0))(
  ( (array!60116 (arr!28921 (Array (_ BitVec 32) (_ BitVec 64))) (size!29400 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60115)

(assert (=> b!969837 (= res!649127 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29400 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29400 _keys!1717))))))

(declare-fun b!969838 () Bool)

(declare-fun res!649126 () Bool)

(assert (=> b!969838 (=> (not res!649126) (not e!546767))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60115 (_ BitVec 32)) Bool)

(assert (=> b!969838 (= res!649126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969839 () Bool)

(declare-fun res!649128 () Bool)

(assert (=> b!969839 (=> (not res!649128) (not e!546767))))

(declare-datatypes ((List!20042 0))(
  ( (Nil!20039) (Cons!20038 (h!21200 (_ BitVec 64)) (t!28405 List!20042)) )
))
(declare-fun arrayNoDuplicates!0 (array!60115 (_ BitVec 32) List!20042) Bool)

(assert (=> b!969839 (= res!649128 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20039))))

(declare-fun res!649123 () Bool)

(assert (=> start!83136 (=> (not res!649123) (not e!546767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83136 (= res!649123 (validMask!0 mask!2147))))

(assert (=> start!83136 e!546767))

(assert (=> start!83136 true))

(declare-datatypes ((V!34353 0))(
  ( (V!34354 (val!11064 Int)) )
))
(declare-datatypes ((ValueCell!10532 0))(
  ( (ValueCellFull!10532 (v!13623 V!34353)) (EmptyCell!10532) )
))
(declare-datatypes ((array!60117 0))(
  ( (array!60118 (arr!28922 (Array (_ BitVec 32) ValueCell!10532)) (size!29401 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60117)

(declare-fun e!546769 () Bool)

(declare-fun array_inv!22387 (array!60117) Bool)

(assert (=> start!83136 (and (array_inv!22387 _values!1425) e!546769)))

(assert (=> start!83136 tp_is_empty!22027))

(assert (=> start!83136 tp!66666))

(declare-fun array_inv!22388 (array!60115) Bool)

(assert (=> start!83136 (array_inv!22388 _keys!1717)))

(declare-fun b!969840 () Bool)

(declare-fun e!546766 () Bool)

(assert (=> b!969840 (= e!546769 (and e!546766 mapRes!35050))))

(declare-fun condMapEmpty!35050 () Bool)

(declare-fun mapDefault!35050 () ValueCell!10532)

