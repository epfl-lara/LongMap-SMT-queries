; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36800 () Bool)

(assert start!36800)

(declare-fun b!367616 () Bool)

(declare-fun e!224957 () Bool)

(declare-fun tp_is_empty!8575 () Bool)

(assert (=> b!367616 (= e!224957 tp_is_empty!8575)))

(declare-fun b!367617 () Bool)

(declare-fun res!205859 () Bool)

(declare-fun e!224956 () Bool)

(assert (=> b!367617 (=> (not res!205859) (not e!224956))))

(declare-datatypes ((array!21109 0))(
  ( (array!21110 (arr!10023 (Array (_ BitVec 32) (_ BitVec 64))) (size!10375 (_ BitVec 32))) )
))
(declare-fun lt!169410 () array!21109)

(declare-datatypes ((List!5570 0))(
  ( (Nil!5567) (Cons!5566 (h!6422 (_ BitVec 64)) (t!10720 List!5570)) )
))
(declare-fun arrayNoDuplicates!0 (array!21109 (_ BitVec 32) List!5570) Bool)

(assert (=> b!367617 (= res!205859 (arrayNoDuplicates!0 lt!169410 #b00000000000000000000000000000000 Nil!5567))))

(declare-fun b!367618 () Bool)

(declare-fun res!205851 () Bool)

(declare-fun e!224952 () Bool)

(assert (=> b!367618 (=> (not res!205851) (not e!224952))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!21109)

(assert (=> b!367618 (= res!205851 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10375 _keys!658))))))

(declare-fun b!367619 () Bool)

(declare-fun res!205853 () Bool)

(assert (=> b!367619 (=> (not res!205853) (not e!224952))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12539 0))(
  ( (V!12540 (val!4332 Int)) )
))
(declare-datatypes ((ValueCell!3944 0))(
  ( (ValueCellFull!3944 (v!6529 V!12539)) (EmptyCell!3944) )
))
(declare-datatypes ((array!21111 0))(
  ( (array!21112 (arr!10024 (Array (_ BitVec 32) ValueCell!3944)) (size!10376 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21111)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367619 (= res!205853 (and (= (size!10376 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10375 _keys!658) (size!10376 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367620 () Bool)

(declare-fun res!205850 () Bool)

(assert (=> b!367620 (=> (not res!205850) (not e!224952))))

(assert (=> b!367620 (= res!205850 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5567))))

(declare-fun b!367621 () Bool)

(declare-fun res!205856 () Bool)

(assert (=> b!367621 (=> (not res!205856) (not e!224952))))

(assert (=> b!367621 (= res!205856 (or (= (select (arr!10023 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10023 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367622 () Bool)

(declare-fun res!205854 () Bool)

(assert (=> b!367622 (=> (not res!205854) (not e!224952))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367622 (= res!205854 (validKeyInArray!0 k!778))))

(declare-fun res!205858 () Bool)

(assert (=> start!36800 (=> (not res!205858) (not e!224952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36800 (= res!205858 (validMask!0 mask!970))))

(assert (=> start!36800 e!224952))

(assert (=> start!36800 true))

(declare-fun e!224953 () Bool)

(declare-fun array_inv!7412 (array!21111) Bool)

(assert (=> start!36800 (and (array_inv!7412 _values!506) e!224953)))

(declare-fun array_inv!7413 (array!21109) Bool)

(assert (=> start!36800 (array_inv!7413 _keys!658)))

(declare-fun b!367623 () Bool)

(declare-fun e!224954 () Bool)

(assert (=> b!367623 (= e!224954 tp_is_empty!8575)))

(declare-fun b!367624 () Bool)

(assert (=> b!367624 (= e!224952 e!224956)))

(declare-fun res!205852 () Bool)

(assert (=> b!367624 (=> (not res!205852) (not e!224956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21109 (_ BitVec 32)) Bool)

(assert (=> b!367624 (= res!205852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169410 mask!970))))

(assert (=> b!367624 (= lt!169410 (array!21110 (store (arr!10023 _keys!658) i!548 k!778) (size!10375 _keys!658)))))

(declare-fun b!367625 () Bool)

(declare-fun mapRes!14427 () Bool)

(assert (=> b!367625 (= e!224953 (and e!224954 mapRes!14427))))

(declare-fun condMapEmpty!14427 () Bool)

(declare-fun mapDefault!14427 () ValueCell!3944)

