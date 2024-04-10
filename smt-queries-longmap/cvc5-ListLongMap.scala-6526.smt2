; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83018 () Bool)

(assert start!83018)

(declare-fun res!648459 () Bool)

(declare-fun e!545990 () Bool)

(assert (=> start!83018 (=> (not res!648459) (not e!545990))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83018 (= res!648459 (validMask!0 mask!2147))))

(assert (=> start!83018 e!545990))

(assert (=> start!83018 true))

(declare-datatypes ((V!34225 0))(
  ( (V!34226 (val!11016 Int)) )
))
(declare-datatypes ((ValueCell!10484 0))(
  ( (ValueCellFull!10484 (v!13574 V!34225)) (EmptyCell!10484) )
))
(declare-datatypes ((array!59937 0))(
  ( (array!59938 (arr!28834 (Array (_ BitVec 32) ValueCell!10484)) (size!29313 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59937)

(declare-fun e!545986 () Bool)

(declare-fun array_inv!22321 (array!59937) Bool)

(assert (=> start!83018 (and (array_inv!22321 _values!1425) e!545986)))

(declare-datatypes ((array!59939 0))(
  ( (array!59940 (arr!28835 (Array (_ BitVec 32) (_ BitVec 64))) (size!29314 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59939)

(declare-fun array_inv!22322 (array!59939) Bool)

(assert (=> start!83018 (array_inv!22322 _keys!1717)))

(declare-fun b!968710 () Bool)

(declare-fun res!648457 () Bool)

(assert (=> b!968710 (=> (not res!648457) (not e!545990))))

(assert (=> b!968710 (= res!648457 (and (bvsle #b00000000000000000000000000000000 (size!29314 _keys!1717)) (bvslt (size!29314 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun b!968711 () Bool)

(declare-fun e!545988 () Bool)

(declare-fun mapRes!34900 () Bool)

(assert (=> b!968711 (= e!545986 (and e!545988 mapRes!34900))))

(declare-fun condMapEmpty!34900 () Bool)

(declare-fun mapDefault!34900 () ValueCell!10484)

