; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37116 () Bool)

(assert start!37116)

(declare-fun b_free!8243 () Bool)

(declare-fun b_next!8243 () Bool)

(assert (=> start!37116 (= b_free!8243 (not b_next!8243))))

(declare-fun tp!29445 () Bool)

(declare-fun b_and!15485 () Bool)

(assert (=> start!37116 (= tp!29445 b_and!15485)))

(declare-fun b!373902 () Bool)

(declare-fun res!210723 () Bool)

(declare-fun e!227912 () Bool)

(assert (=> b!373902 (=> (not res!210723) (not e!227912))))

(declare-datatypes ((array!21721 0))(
  ( (array!21722 (arr!10329 (Array (_ BitVec 32) (_ BitVec 64))) (size!10681 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21721)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373902 (= res!210723 (or (= (select (arr!10329 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10329 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373903 () Bool)

(declare-fun e!227916 () Bool)

(declare-fun tp_is_empty!8891 () Bool)

(assert (=> b!373903 (= e!227916 tp_is_empty!8891)))

(declare-fun b!373904 () Bool)

(declare-fun res!210720 () Bool)

(assert (=> b!373904 (=> (not res!210720) (not e!227912))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373904 (= res!210720 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373905 () Bool)

(declare-fun res!210725 () Bool)

(assert (=> b!373905 (=> (not res!210725) (not e!227912))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21721 (_ BitVec 32)) Bool)

(assert (=> b!373905 (= res!210725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!210717 () Bool)

(assert (=> start!37116 (=> (not res!210717) (not e!227912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37116 (= res!210717 (validMask!0 mask!970))))

(assert (=> start!37116 e!227912))

(declare-datatypes ((V!12959 0))(
  ( (V!12960 (val!4490 Int)) )
))
(declare-datatypes ((ValueCell!4102 0))(
  ( (ValueCellFull!4102 (v!6687 V!12959)) (EmptyCell!4102) )
))
(declare-datatypes ((array!21723 0))(
  ( (array!21724 (arr!10330 (Array (_ BitVec 32) ValueCell!4102)) (size!10682 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21723)

(declare-fun e!227914 () Bool)

(declare-fun array_inv!7614 (array!21723) Bool)

(assert (=> start!37116 (and (array_inv!7614 _values!506) e!227914)))

(assert (=> start!37116 tp!29445))

(assert (=> start!37116 true))

(assert (=> start!37116 tp_is_empty!8891))

(declare-fun array_inv!7615 (array!21721) Bool)

(assert (=> start!37116 (array_inv!7615 _keys!658)))

(declare-fun b!373906 () Bool)

(declare-fun res!210724 () Bool)

(assert (=> b!373906 (=> (not res!210724) (not e!227912))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373906 (= res!210724 (and (= (size!10682 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10681 _keys!658) (size!10682 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373907 () Bool)

(declare-fun mapRes!14901 () Bool)

(assert (=> b!373907 (= e!227914 (and e!227916 mapRes!14901))))

(declare-fun condMapEmpty!14901 () Bool)

(declare-fun mapDefault!14901 () ValueCell!4102)

