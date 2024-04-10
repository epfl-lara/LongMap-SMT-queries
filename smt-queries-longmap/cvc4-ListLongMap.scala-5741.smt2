; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74278 () Bool)

(assert start!74278)

(declare-fun b_free!15041 () Bool)

(declare-fun b_next!15041 () Bool)

(assert (=> start!74278 (= b_free!15041 (not b_next!15041))))

(declare-fun tp!52797 () Bool)

(declare-fun b_and!24817 () Bool)

(assert (=> start!74278 (= tp!52797 b_and!24817)))

(declare-fun b!873851 () Bool)

(declare-fun e!486602 () Bool)

(declare-fun tp_is_empty!17285 () Bool)

(assert (=> b!873851 (= e!486602 tp_is_empty!17285)))

(declare-fun b!873852 () Bool)

(declare-fun res!593826 () Bool)

(declare-fun e!486601 () Bool)

(assert (=> b!873852 (=> (not res!593826) (not e!486601))))

(declare-datatypes ((array!50698 0))(
  ( (array!50699 (arr!24377 (Array (_ BitVec 32) (_ BitVec 64))) (size!24817 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50698)

(declare-datatypes ((List!17304 0))(
  ( (Nil!17301) (Cons!17300 (h!18431 (_ BitVec 64)) (t!24345 List!17304)) )
))
(declare-fun arrayNoDuplicates!0 (array!50698 (_ BitVec 32) List!17304) Bool)

(assert (=> b!873852 (= res!593826 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17301))))

(declare-fun b!873853 () Bool)

(declare-fun res!593820 () Bool)

(assert (=> b!873853 (=> (not res!593820) (not e!486601))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50698 (_ BitVec 32)) Bool)

(assert (=> b!873853 (= res!593820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873854 () Bool)

(declare-fun res!593821 () Bool)

(assert (=> b!873854 (=> (not res!593821) (not e!486601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873854 (= res!593821 (validMask!0 mask!1196))))

(declare-fun b!873855 () Bool)

(declare-fun res!593823 () Bool)

(assert (=> b!873855 (=> (not res!593823) (not e!486601))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873855 (= res!593823 (and (= (select (arr!24377 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!873856 () Bool)

(declare-fun e!486605 () Bool)

(declare-fun mapRes!27536 () Bool)

(assert (=> b!873856 (= e!486605 (and e!486602 mapRes!27536))))

(declare-fun condMapEmpty!27536 () Bool)

(declare-datatypes ((V!28093 0))(
  ( (V!28094 (val!8690 Int)) )
))
(declare-datatypes ((ValueCell!8203 0))(
  ( (ValueCellFull!8203 (v!11119 V!28093)) (EmptyCell!8203) )
))
(declare-datatypes ((array!50700 0))(
  ( (array!50701 (arr!24378 (Array (_ BitVec 32) ValueCell!8203)) (size!24818 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50700)

(declare-fun mapDefault!27536 () ValueCell!8203)

