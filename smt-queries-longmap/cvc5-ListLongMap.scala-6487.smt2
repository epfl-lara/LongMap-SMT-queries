; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82762 () Bool)

(assert start!82762)

(declare-fun b_free!18895 () Bool)

(declare-fun b_next!18895 () Bool)

(assert (=> start!82762 (= b_free!18895 (not b_next!18895))))

(declare-fun tp!65804 () Bool)

(declare-fun b_and!30383 () Bool)

(assert (=> start!82762 (= tp!65804 b_and!30383)))

(declare-fun b!965327 () Bool)

(declare-fun res!646166 () Bool)

(declare-fun e!544177 () Bool)

(assert (=> b!965327 (=> (not res!646166) (not e!544177))))

(declare-datatypes ((array!59479 0))(
  ( (array!59480 (arr!28608 (Array (_ BitVec 32) (_ BitVec 64))) (size!29087 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59479)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59479 (_ BitVec 32)) Bool)

(assert (=> b!965327 (= res!646166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965328 () Bool)

(declare-fun res!646163 () Bool)

(assert (=> b!965328 (=> (not res!646163) (not e!544177))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965328 (= res!646163 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29087 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29087 _keys!1686))))))

(declare-fun b!965329 () Bool)

(declare-fun res!646165 () Bool)

(assert (=> b!965329 (=> (not res!646165) (not e!544177))))

(declare-datatypes ((List!19857 0))(
  ( (Nil!19854) (Cons!19853 (h!21015 (_ BitVec 64)) (t!28220 List!19857)) )
))
(declare-fun arrayNoDuplicates!0 (array!59479 (_ BitVec 32) List!19857) Bool)

(assert (=> b!965329 (= res!646165 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19854))))

(declare-fun b!965330 () Bool)

(declare-fun res!646167 () Bool)

(assert (=> b!965330 (=> (not res!646167) (not e!544177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965330 (= res!646167 (validKeyInArray!0 (select (arr!28608 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34540 () Bool)

(declare-fun mapRes!34540 () Bool)

(assert (=> mapIsEmpty!34540 mapRes!34540))

(declare-fun res!646164 () Bool)

(assert (=> start!82762 (=> (not res!646164) (not e!544177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82762 (= res!646164 (validMask!0 mask!2110))))

(assert (=> start!82762 e!544177))

(assert (=> start!82762 true))

(declare-datatypes ((V!33913 0))(
  ( (V!33914 (val!10899 Int)) )
))
(declare-datatypes ((ValueCell!10367 0))(
  ( (ValueCellFull!10367 (v!13457 V!33913)) (EmptyCell!10367) )
))
(declare-datatypes ((array!59481 0))(
  ( (array!59482 (arr!28609 (Array (_ BitVec 32) ValueCell!10367)) (size!29088 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59481)

(declare-fun e!544180 () Bool)

(declare-fun array_inv!22155 (array!59481) Bool)

(assert (=> start!82762 (and (array_inv!22155 _values!1400) e!544180)))

(declare-fun array_inv!22156 (array!59479) Bool)

(assert (=> start!82762 (array_inv!22156 _keys!1686)))

(assert (=> start!82762 tp!65804))

(declare-fun tp_is_empty!21697 () Bool)

(assert (=> start!82762 tp_is_empty!21697))

(declare-fun b!965331 () Bool)

(declare-fun e!544181 () Bool)

(assert (=> b!965331 (= e!544181 tp_is_empty!21697)))

(declare-fun b!965332 () Bool)

(declare-fun e!544179 () Bool)

(assert (=> b!965332 (= e!544179 tp_is_empty!21697)))

(declare-fun b!965333 () Bool)

(assert (=> b!965333 (= e!544177 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33913)

(declare-fun lt!431227 () Bool)

(declare-fun zeroValue!1342 () V!33913)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14014 0))(
  ( (tuple2!14015 (_1!7018 (_ BitVec 64)) (_2!7018 V!33913)) )
))
(declare-datatypes ((List!19858 0))(
  ( (Nil!19855) (Cons!19854 (h!21016 tuple2!14014) (t!28221 List!19858)) )
))
(declare-datatypes ((ListLongMap!12711 0))(
  ( (ListLongMap!12712 (toList!6371 List!19858)) )
))
(declare-fun contains!5474 (ListLongMap!12711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3604 (array!59479 array!59481 (_ BitVec 32) (_ BitVec 32) V!33913 V!33913 (_ BitVec 32) Int) ListLongMap!12711)

(assert (=> b!965333 (= lt!431227 (contains!5474 (getCurrentListMap!3604 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28608 _keys!1686) i!803)))))

(declare-fun b!965334 () Bool)

(assert (=> b!965334 (= e!544180 (and e!544179 mapRes!34540))))

(declare-fun condMapEmpty!34540 () Bool)

(declare-fun mapDefault!34540 () ValueCell!10367)

