; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82220 () Bool)

(assert start!82220)

(declare-fun b_free!18493 () Bool)

(declare-fun b_next!18493 () Bool)

(assert (=> start!82220 (= b_free!18493 (not b_next!18493))))

(declare-fun tp!64440 () Bool)

(declare-fun b_and!29981 () Bool)

(assert (=> start!82220 (= tp!64440 b_and!29981)))

(declare-fun b!958334 () Bool)

(declare-fun res!641480 () Bool)

(declare-fun e!540269 () Bool)

(assert (=> b!958334 (=> (not res!641480) (not e!540269))))

(declare-datatypes ((array!58499 0))(
  ( (array!58500 (arr!28123 (Array (_ BitVec 32) (_ BitVec 64))) (size!28602 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58499)

(declare-datatypes ((List!19551 0))(
  ( (Nil!19548) (Cons!19547 (h!20709 (_ BitVec 64)) (t!27914 List!19551)) )
))
(declare-fun arrayNoDuplicates!0 (array!58499 (_ BitVec 32) List!19551) Bool)

(assert (=> b!958334 (= res!641480 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19548))))

(declare-fun b!958335 () Bool)

(declare-fun res!641477 () Bool)

(assert (=> b!958335 (=> (not res!641477) (not e!540269))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958335 (= res!641477 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28602 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28602 _keys!1668))))))

(declare-fun mapIsEmpty!33778 () Bool)

(declare-fun mapRes!33778 () Bool)

(assert (=> mapIsEmpty!33778 mapRes!33778))

(declare-fun b!958336 () Bool)

(declare-fun res!641479 () Bool)

(assert (=> b!958336 (=> (not res!641479) (not e!540269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958336 (= res!641479 (validKeyInArray!0 (select (arr!28123 _keys!1668) i!793)))))

(declare-fun b!958337 () Bool)

(declare-fun res!641475 () Bool)

(assert (=> b!958337 (=> (not res!641475) (not e!540269))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58499 (_ BitVec 32)) Bool)

(assert (=> b!958337 (= res!641475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958338 () Bool)

(assert (=> b!958338 (= e!540269 false)))

(declare-fun lt!430431 () Bool)

(declare-datatypes ((V!33249 0))(
  ( (V!33250 (val!10650 Int)) )
))
(declare-fun minValue!1328 () V!33249)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10118 0))(
  ( (ValueCellFull!10118 (v!13207 V!33249)) (EmptyCell!10118) )
))
(declare-datatypes ((array!58501 0))(
  ( (array!58502 (arr!28124 (Array (_ BitVec 32) ValueCell!10118)) (size!28603 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58501)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33249)

(declare-datatypes ((tuple2!13730 0))(
  ( (tuple2!13731 (_1!6876 (_ BitVec 64)) (_2!6876 V!33249)) )
))
(declare-datatypes ((List!19552 0))(
  ( (Nil!19549) (Cons!19548 (h!20710 tuple2!13730) (t!27915 List!19552)) )
))
(declare-datatypes ((ListLongMap!12427 0))(
  ( (ListLongMap!12428 (toList!6229 List!19552)) )
))
(declare-fun contains!5330 (ListLongMap!12427 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3462 (array!58499 array!58501 (_ BitVec 32) (_ BitVec 32) V!33249 V!33249 (_ BitVec 32) Int) ListLongMap!12427)

(assert (=> b!958338 (= lt!430431 (contains!5330 (getCurrentListMap!3462 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28123 _keys!1668) i!793)))))

(declare-fun b!958339 () Bool)

(declare-fun e!540267 () Bool)

(declare-fun e!540266 () Bool)

(assert (=> b!958339 (= e!540267 (and e!540266 mapRes!33778))))

(declare-fun condMapEmpty!33778 () Bool)

(declare-fun mapDefault!33778 () ValueCell!10118)

