; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36662 () Bool)

(assert start!36662)

(declare-fun b!365873 () Bool)

(declare-fun res!204578 () Bool)

(declare-fun e!224066 () Bool)

(assert (=> b!365873 (=> (not res!204578) (not e!224066))))

(declare-datatypes ((array!20923 0))(
  ( (array!20924 (arr!9933 (Array (_ BitVec 32) (_ BitVec 64))) (size!10285 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20923)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365873 (= res!204578 (or (= (select (arr!9933 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9933 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!365874 () Bool)

(declare-fun res!204579 () Bool)

(assert (=> b!365874 (=> (not res!204579) (not e!224066))))

(assert (=> b!365874 (= res!204579 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10285 _keys!658))))))

(declare-fun b!365875 () Bool)

(declare-fun res!204584 () Bool)

(assert (=> b!365875 (=> (not res!204584) (not e!224066))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365875 (= res!204584 (validKeyInArray!0 k!778))))

(declare-fun b!365876 () Bool)

(declare-fun res!204583 () Bool)

(assert (=> b!365876 (=> (not res!204583) (not e!224066))))

(declare-datatypes ((List!5536 0))(
  ( (Nil!5533) (Cons!5532 (h!6388 (_ BitVec 64)) (t!10686 List!5536)) )
))
(declare-fun arrayNoDuplicates!0 (array!20923 (_ BitVec 32) List!5536) Bool)

(assert (=> b!365876 (= res!204583 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5533))))

(declare-fun b!365877 () Bool)

(declare-fun e!224069 () Bool)

(declare-fun tp_is_empty!8485 () Bool)

(assert (=> b!365877 (= e!224069 tp_is_empty!8485)))

(declare-fun b!365878 () Bool)

(declare-fun e!224068 () Bool)

(declare-fun e!224067 () Bool)

(declare-fun mapRes!14283 () Bool)

(assert (=> b!365878 (= e!224068 (and e!224067 mapRes!14283))))

(declare-fun condMapEmpty!14283 () Bool)

(declare-datatypes ((V!12419 0))(
  ( (V!12420 (val!4287 Int)) )
))
(declare-datatypes ((ValueCell!3899 0))(
  ( (ValueCellFull!3899 (v!6483 V!12419)) (EmptyCell!3899) )
))
(declare-datatypes ((array!20925 0))(
  ( (array!20926 (arr!9934 (Array (_ BitVec 32) ValueCell!3899)) (size!10286 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20925)

(declare-fun mapDefault!14283 () ValueCell!3899)

