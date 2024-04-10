; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37028 () Bool)

(assert start!37028)

(declare-fun b_free!8155 () Bool)

(declare-fun b_next!8155 () Bool)

(assert (=> start!37028 (= b_free!8155 (not b_next!8155))))

(declare-fun tp!29181 () Bool)

(declare-fun b_and!15397 () Bool)

(assert (=> start!37028 (= tp!29181 b_and!15397)))

(declare-fun b!372062 () Bool)

(declare-fun e!227005 () Bool)

(declare-fun e!227004 () Bool)

(assert (=> b!372062 (= e!227005 e!227004)))

(declare-fun res!209272 () Bool)

(assert (=> b!372062 (=> (not res!209272) (not e!227004))))

(declare-datatypes ((array!21547 0))(
  ( (array!21548 (arr!10242 (Array (_ BitVec 32) (_ BitVec 64))) (size!10594 (_ BitVec 32))) )
))
(declare-fun lt!170552 () array!21547)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21547 (_ BitVec 32)) Bool)

(assert (=> b!372062 (= res!209272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170552 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21547)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372062 (= lt!170552 (array!21548 (store (arr!10242 _keys!658) i!548 k!778) (size!10594 _keys!658)))))

(declare-fun b!372063 () Bool)

(declare-fun res!209275 () Bool)

(assert (=> b!372063 (=> (not res!209275) (not e!227005))))

(assert (=> b!372063 (= res!209275 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10594 _keys!658))))))

(declare-fun b!372064 () Bool)

(declare-fun res!209277 () Bool)

(assert (=> b!372064 (=> (not res!209277) (not e!227005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372064 (= res!209277 (validKeyInArray!0 k!778))))

(declare-fun b!372065 () Bool)

(declare-fun res!209276 () Bool)

(assert (=> b!372065 (=> (not res!209276) (not e!227004))))

(declare-datatypes ((List!5742 0))(
  ( (Nil!5739) (Cons!5738 (h!6594 (_ BitVec 64)) (t!10892 List!5742)) )
))
(declare-fun arrayNoDuplicates!0 (array!21547 (_ BitVec 32) List!5742) Bool)

(assert (=> b!372065 (= res!209276 (arrayNoDuplicates!0 lt!170552 #b00000000000000000000000000000000 Nil!5739))))

(declare-fun b!372066 () Bool)

(declare-fun e!227006 () Bool)

(declare-fun e!227007 () Bool)

(declare-fun mapRes!14769 () Bool)

(assert (=> b!372066 (= e!227006 (and e!227007 mapRes!14769))))

(declare-fun condMapEmpty!14769 () Bool)

(declare-datatypes ((V!12843 0))(
  ( (V!12844 (val!4446 Int)) )
))
(declare-datatypes ((ValueCell!4058 0))(
  ( (ValueCellFull!4058 (v!6643 V!12843)) (EmptyCell!4058) )
))
(declare-datatypes ((array!21549 0))(
  ( (array!21550 (arr!10243 (Array (_ BitVec 32) ValueCell!4058)) (size!10595 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21549)

(declare-fun mapDefault!14769 () ValueCell!4058)

