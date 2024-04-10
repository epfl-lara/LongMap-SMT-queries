; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82712 () Bool)

(assert start!82712)

(declare-fun b_free!18845 () Bool)

(declare-fun b_next!18845 () Bool)

(assert (=> start!82712 (= b_free!18845 (not b_next!18845))))

(declare-fun tp!65655 () Bool)

(declare-fun b_and!30333 () Bool)

(assert (=> start!82712 (= tp!65655 b_and!30333)))

(declare-fun b!964568 () Bool)

(declare-fun res!645635 () Bool)

(declare-fun e!543777 () Bool)

(assert (=> b!964568 (=> (not res!645635) (not e!543777))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33845 0))(
  ( (V!33846 (val!10874 Int)) )
))
(declare-datatypes ((ValueCell!10342 0))(
  ( (ValueCellFull!10342 (v!13432 V!33845)) (EmptyCell!10342) )
))
(declare-datatypes ((array!59381 0))(
  ( (array!59382 (arr!28559 (Array (_ BitVec 32) ValueCell!10342)) (size!29038 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59381)

(declare-datatypes ((array!59383 0))(
  ( (array!59384 (arr!28560 (Array (_ BitVec 32) (_ BitVec 64))) (size!29039 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59383)

(declare-fun minValue!1342 () V!33845)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33845)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13974 0))(
  ( (tuple2!13975 (_1!6998 (_ BitVec 64)) (_2!6998 V!33845)) )
))
(declare-datatypes ((List!19820 0))(
  ( (Nil!19817) (Cons!19816 (h!20978 tuple2!13974) (t!28183 List!19820)) )
))
(declare-datatypes ((ListLongMap!12671 0))(
  ( (ListLongMap!12672 (toList!6351 List!19820)) )
))
(declare-fun contains!5454 (ListLongMap!12671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3584 (array!59383 array!59381 (_ BitVec 32) (_ BitVec 32) V!33845 V!33845 (_ BitVec 32) Int) ListLongMap!12671)

(assert (=> b!964568 (= res!645635 (contains!5454 (getCurrentListMap!3584 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28560 _keys!1686) i!803)))))

(declare-fun res!645630 () Bool)

(assert (=> start!82712 (=> (not res!645630) (not e!543777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82712 (= res!645630 (validMask!0 mask!2110))))

(assert (=> start!82712 e!543777))

(assert (=> start!82712 true))

(declare-fun e!543779 () Bool)

(declare-fun array_inv!22115 (array!59381) Bool)

(assert (=> start!82712 (and (array_inv!22115 _values!1400) e!543779)))

(declare-fun array_inv!22116 (array!59383) Bool)

(assert (=> start!82712 (array_inv!22116 _keys!1686)))

(assert (=> start!82712 tp!65655))

(declare-fun tp_is_empty!21647 () Bool)

(assert (=> start!82712 tp_is_empty!21647))

(declare-fun b!964569 () Bool)

(declare-fun res!645632 () Bool)

(assert (=> b!964569 (=> (not res!645632) (not e!543777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59383 (_ BitVec 32)) Bool)

(assert (=> b!964569 (= res!645632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964570 () Bool)

(declare-fun e!543778 () Bool)

(assert (=> b!964570 (= e!543778 tp_is_empty!21647)))

(declare-fun b!964571 () Bool)

(declare-fun res!645634 () Bool)

(assert (=> b!964571 (=> (not res!645634) (not e!543777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964571 (= res!645634 (validKeyInArray!0 (select (arr!28560 _keys!1686) i!803)))))

(declare-fun b!964572 () Bool)

(declare-fun mapRes!34465 () Bool)

(assert (=> b!964572 (= e!543779 (and e!543778 mapRes!34465))))

(declare-fun condMapEmpty!34465 () Bool)

(declare-fun mapDefault!34465 () ValueCell!10342)

