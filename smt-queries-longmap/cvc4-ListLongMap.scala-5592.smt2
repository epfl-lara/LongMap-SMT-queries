; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73340 () Bool)

(assert start!73340)

(declare-fun b_free!14255 () Bool)

(declare-fun b_next!14255 () Bool)

(assert (=> start!73340 (= b_free!14255 (not b_next!14255))))

(declare-fun tp!50268 () Bool)

(declare-fun b_and!23611 () Bool)

(assert (=> start!73340 (= tp!50268 b_and!23611)))

(declare-fun b!855733 () Bool)

(declare-fun res!581174 () Bool)

(declare-fun e!477054 () Bool)

(assert (=> b!855733 (=> (not res!581174) (not e!477054))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855733 (= res!581174 (validMask!0 mask!1196))))

(declare-fun b!855734 () Bool)

(declare-fun res!581172 () Bool)

(assert (=> b!855734 (=> (not res!581172) (not e!477054))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48978 0))(
  ( (array!48979 (arr!23520 (Array (_ BitVec 32) (_ BitVec 64))) (size!23960 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48978)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855734 (= res!581172 (and (= (select (arr!23520 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!581171 () Bool)

(assert (=> start!73340 (=> (not res!581171) (not e!477054))))

(assert (=> start!73340 (= res!581171 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23960 _keys!868))))))

(assert (=> start!73340 e!477054))

(declare-fun tp_is_empty!16391 () Bool)

(assert (=> start!73340 tp_is_empty!16391))

(assert (=> start!73340 true))

(assert (=> start!73340 tp!50268))

(declare-fun array_inv!18638 (array!48978) Bool)

(assert (=> start!73340 (array_inv!18638 _keys!868)))

(declare-datatypes ((V!26901 0))(
  ( (V!26902 (val!8243 Int)) )
))
(declare-datatypes ((ValueCell!7756 0))(
  ( (ValueCellFull!7756 (v!10668 V!26901)) (EmptyCell!7756) )
))
(declare-datatypes ((array!48980 0))(
  ( (array!48981 (arr!23521 (Array (_ BitVec 32) ValueCell!7756)) (size!23961 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48980)

(declare-fun e!477058 () Bool)

(declare-fun array_inv!18639 (array!48980) Bool)

(assert (=> start!73340 (and (array_inv!18639 _values!688) e!477058)))

(declare-fun b!855735 () Bool)

(declare-fun res!581176 () Bool)

(assert (=> b!855735 (=> (not res!581176) (not e!477054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855735 (= res!581176 (validKeyInArray!0 k!854))))

(declare-fun b!855736 () Bool)

(declare-fun res!581177 () Bool)

(assert (=> b!855736 (=> (not res!581177) (not e!477054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48978 (_ BitVec 32)) Bool)

(assert (=> b!855736 (= res!581177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855737 () Bool)

(declare-fun res!581175 () Bool)

(assert (=> b!855737 (=> (not res!581175) (not e!477054))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!855737 (= res!581175 (and (= (size!23961 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23960 _keys!868) (size!23961 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855738 () Bool)

(declare-fun e!477055 () Bool)

(declare-fun mapRes!26186 () Bool)

(assert (=> b!855738 (= e!477058 (and e!477055 mapRes!26186))))

(declare-fun condMapEmpty!26186 () Bool)

(declare-fun mapDefault!26186 () ValueCell!7756)

