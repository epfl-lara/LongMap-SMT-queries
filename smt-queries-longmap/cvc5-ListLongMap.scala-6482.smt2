; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82732 () Bool)

(assert start!82732)

(declare-fun b_free!18865 () Bool)

(declare-fun b_next!18865 () Bool)

(assert (=> start!82732 (= b_free!18865 (not b_next!18865))))

(declare-fun tp!65714 () Bool)

(declare-fun b_and!30353 () Bool)

(assert (=> start!82732 (= tp!65714 b_and!30353)))

(declare-fun res!645895 () Bool)

(declare-fun e!543954 () Bool)

(assert (=> start!82732 (=> (not res!645895) (not e!543954))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82732 (= res!645895 (validMask!0 mask!2110))))

(assert (=> start!82732 e!543954))

(assert (=> start!82732 true))

(declare-datatypes ((V!33873 0))(
  ( (V!33874 (val!10884 Int)) )
))
(declare-datatypes ((ValueCell!10352 0))(
  ( (ValueCellFull!10352 (v!13442 V!33873)) (EmptyCell!10352) )
))
(declare-datatypes ((array!59419 0))(
  ( (array!59420 (arr!28578 (Array (_ BitVec 32) ValueCell!10352)) (size!29057 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59419)

(declare-fun e!543956 () Bool)

(declare-fun array_inv!22127 (array!59419) Bool)

(assert (=> start!82732 (and (array_inv!22127 _values!1400) e!543956)))

(declare-datatypes ((array!59421 0))(
  ( (array!59422 (arr!28579 (Array (_ BitVec 32) (_ BitVec 64))) (size!29058 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59421)

(declare-fun array_inv!22128 (array!59421) Bool)

(assert (=> start!82732 (array_inv!22128 _keys!1686)))

(assert (=> start!82732 tp!65714))

(declare-fun tp_is_empty!21667 () Bool)

(assert (=> start!82732 tp_is_empty!21667))

(declare-fun b!964922 () Bool)

(declare-fun e!543955 () Bool)

(assert (=> b!964922 (= e!543955 tp_is_empty!21667)))

(declare-fun b!964923 () Bool)

(assert (=> b!964923 (= e!543954 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun lt!431182 () Bool)

(declare-fun minValue!1342 () V!33873)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33873)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13992 0))(
  ( (tuple2!13993 (_1!7007 (_ BitVec 64)) (_2!7007 V!33873)) )
))
(declare-datatypes ((List!19836 0))(
  ( (Nil!19833) (Cons!19832 (h!20994 tuple2!13992) (t!28199 List!19836)) )
))
(declare-datatypes ((ListLongMap!12689 0))(
  ( (ListLongMap!12690 (toList!6360 List!19836)) )
))
(declare-fun contains!5463 (ListLongMap!12689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3593 (array!59421 array!59419 (_ BitVec 32) (_ BitVec 32) V!33873 V!33873 (_ BitVec 32) Int) ListLongMap!12689)

(assert (=> b!964923 (= lt!431182 (contains!5463 (getCurrentListMap!3593 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28579 _keys!1686) i!803)))))

(declare-fun b!964924 () Bool)

(declare-fun mapRes!34495 () Bool)

(assert (=> b!964924 (= e!543956 (and e!543955 mapRes!34495))))

(declare-fun condMapEmpty!34495 () Bool)

(declare-fun mapDefault!34495 () ValueCell!10352)

