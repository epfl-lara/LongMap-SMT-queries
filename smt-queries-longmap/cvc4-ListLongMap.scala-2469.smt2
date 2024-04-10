; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38636 () Bool)

(assert start!38636)

(declare-fun b_free!9173 () Bool)

(declare-fun b_next!9173 () Bool)

(assert (=> start!38636 (= b_free!9173 (not b_next!9173))))

(declare-fun tp!32643 () Bool)

(declare-fun b_and!16559 () Bool)

(assert (=> start!38636 (= tp!32643 b_and!16559)))

(declare-fun b!400870 () Bool)

(declare-fun res!230689 () Bool)

(declare-fun e!241822 () Bool)

(assert (=> b!400870 (=> (not res!230689) (not e!241822))))

(declare-datatypes ((array!24019 0))(
  ( (array!24020 (arr!11459 (Array (_ BitVec 32) (_ BitVec 64))) (size!11811 (_ BitVec 32))) )
))
(declare-fun lt!187744 () array!24019)

(declare-datatypes ((List!6651 0))(
  ( (Nil!6648) (Cons!6647 (h!7503 (_ BitVec 64)) (t!11825 List!6651)) )
))
(declare-fun arrayNoDuplicates!0 (array!24019 (_ BitVec 32) List!6651) Bool)

(assert (=> b!400870 (= res!230689 (arrayNoDuplicates!0 lt!187744 #b00000000000000000000000000000000 Nil!6648))))

(declare-fun b!400871 () Bool)

(declare-fun res!230686 () Bool)

(declare-fun e!241823 () Bool)

(assert (=> b!400871 (=> (not res!230686) (not e!241823))))

(declare-fun _keys!709 () array!24019)

(assert (=> b!400871 (= res!230686 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6648))))

(declare-fun res!230693 () Bool)

(assert (=> start!38636 (=> (not res!230693) (not e!241823))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38636 (= res!230693 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11811 _keys!709))))))

(assert (=> start!38636 e!241823))

(declare-fun tp_is_empty!10055 () Bool)

(assert (=> start!38636 tp_is_empty!10055))

(assert (=> start!38636 tp!32643))

(assert (=> start!38636 true))

(declare-datatypes ((V!14511 0))(
  ( (V!14512 (val!5072 Int)) )
))
(declare-datatypes ((ValueCell!4684 0))(
  ( (ValueCellFull!4684 (v!7319 V!14511)) (EmptyCell!4684) )
))
(declare-datatypes ((array!24021 0))(
  ( (array!24022 (arr!11460 (Array (_ BitVec 32) ValueCell!4684)) (size!11812 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24021)

(declare-fun e!241821 () Bool)

(declare-fun array_inv!8390 (array!24021) Bool)

(assert (=> start!38636 (and (array_inv!8390 _values!549) e!241821)))

(declare-fun array_inv!8391 (array!24019) Bool)

(assert (=> start!38636 (array_inv!8391 _keys!709)))

(declare-fun b!400872 () Bool)

(declare-fun e!241819 () Bool)

(assert (=> b!400872 (= e!241819 tp_is_empty!10055)))

(declare-fun b!400873 () Bool)

(declare-fun res!230691 () Bool)

(assert (=> b!400873 (=> (not res!230691) (not e!241823))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!400873 (= res!230691 (and (= (size!11812 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11811 _keys!709) (size!11812 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16704 () Bool)

(declare-fun mapRes!16704 () Bool)

(assert (=> mapIsEmpty!16704 mapRes!16704))

(declare-fun b!400874 () Bool)

(declare-fun res!230687 () Bool)

(assert (=> b!400874 (=> (not res!230687) (not e!241823))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400874 (= res!230687 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11811 _keys!709))))))

(declare-fun b!400875 () Bool)

(assert (=> b!400875 (= e!241823 e!241822)))

(declare-fun res!230697 () Bool)

(assert (=> b!400875 (=> (not res!230697) (not e!241822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24019 (_ BitVec 32)) Bool)

(assert (=> b!400875 (= res!230697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187744 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!400875 (= lt!187744 (array!24020 (store (arr!11459 _keys!709) i!563 k!794) (size!11811 _keys!709)))))

(declare-fun b!400876 () Bool)

(declare-fun res!230690 () Bool)

(assert (=> b!400876 (=> (not res!230690) (not e!241823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400876 (= res!230690 (validKeyInArray!0 k!794))))

(declare-fun b!400877 () Bool)

(declare-fun e!241820 () Bool)

(assert (=> b!400877 (= e!241821 (and e!241820 mapRes!16704))))

(declare-fun condMapEmpty!16704 () Bool)

(declare-fun mapDefault!16704 () ValueCell!4684)

