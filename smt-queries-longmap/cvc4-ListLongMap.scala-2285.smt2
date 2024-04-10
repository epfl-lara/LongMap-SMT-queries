; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37176 () Bool)

(assert start!37176)

(declare-fun b_free!8303 () Bool)

(declare-fun b_next!8303 () Bool)

(assert (=> start!37176 (= b_free!8303 (not b_next!8303))))

(declare-fun tp!29624 () Bool)

(declare-fun b_and!15545 () Bool)

(assert (=> start!37176 (= tp!29624 b_and!15545)))

(declare-fun b!375252 () Bool)

(declare-fun e!228631 () Bool)

(declare-fun tp_is_empty!8951 () Bool)

(assert (=> b!375252 (= e!228631 tp_is_empty!8951)))

(declare-fun b!375253 () Bool)

(declare-fun res!211805 () Bool)

(declare-fun e!228632 () Bool)

(assert (=> b!375253 (=> (not res!211805) (not e!228632))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21837 0))(
  ( (array!21838 (arr!10387 (Array (_ BitVec 32) (_ BitVec 64))) (size!10739 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21837)

(assert (=> b!375253 (= res!211805 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10739 _keys!658))))))

(declare-fun b!375254 () Bool)

(declare-fun res!211798 () Bool)

(assert (=> b!375254 (=> (not res!211798) (not e!228632))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21837 (_ BitVec 32)) Bool)

(assert (=> b!375254 (= res!211798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14991 () Bool)

(declare-fun mapRes!14991 () Bool)

(assert (=> mapIsEmpty!14991 mapRes!14991))

(declare-fun b!375255 () Bool)

(declare-fun res!211800 () Bool)

(assert (=> b!375255 (=> (not res!211800) (not e!228632))))

(assert (=> b!375255 (= res!211800 (or (= (select (arr!10387 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10387 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375256 () Bool)

(declare-fun e!228636 () Bool)

(assert (=> b!375256 (= e!228636 (and e!228631 mapRes!14991))))

(declare-fun condMapEmpty!14991 () Bool)

(declare-datatypes ((V!13039 0))(
  ( (V!13040 (val!4520 Int)) )
))
(declare-datatypes ((ValueCell!4132 0))(
  ( (ValueCellFull!4132 (v!6717 V!13039)) (EmptyCell!4132) )
))
(declare-datatypes ((array!21839 0))(
  ( (array!21840 (arr!10388 (Array (_ BitVec 32) ValueCell!4132)) (size!10740 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21839)

(declare-fun mapDefault!14991 () ValueCell!4132)

