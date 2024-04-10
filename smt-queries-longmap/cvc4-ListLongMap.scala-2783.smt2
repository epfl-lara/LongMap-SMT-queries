; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40590 () Bool)

(assert start!40590)

(declare-fun b_free!10601 () Bool)

(declare-fun b_next!10601 () Bool)

(assert (=> start!40590 (= b_free!10601 (not b_next!10601))))

(declare-fun tp!37623 () Bool)

(declare-fun b_and!18609 () Bool)

(assert (=> start!40590 (= tp!37623 b_and!18609)))

(declare-fun b!447692 () Bool)

(declare-fun e!262832 () Bool)

(declare-fun e!262829 () Bool)

(assert (=> b!447692 (= e!262832 e!262829)))

(declare-fun res!265943 () Bool)

(assert (=> b!447692 (=> (not res!265943) (not e!262829))))

(declare-datatypes ((array!27685 0))(
  ( (array!27686 (arr!13288 (Array (_ BitVec 32) (_ BitVec 64))) (size!13640 (_ BitVec 32))) )
))
(declare-fun lt!204017 () array!27685)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27685 (_ BitVec 32)) Bool)

(assert (=> b!447692 (= res!265943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204017 mask!1025))))

(declare-fun _keys!709 () array!27685)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447692 (= lt!204017 (array!27686 (store (arr!13288 _keys!709) i!563 k!794) (size!13640 _keys!709)))))

(declare-fun b!447693 () Bool)

(declare-fun res!265941 () Bool)

(assert (=> b!447693 (=> (not res!265941) (not e!262832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447693 (= res!265941 (validKeyInArray!0 k!794))))

(declare-fun res!265938 () Bool)

(assert (=> start!40590 (=> (not res!265938) (not e!262832))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40590 (= res!265938 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13640 _keys!709))))))

(assert (=> start!40590 e!262832))

(declare-fun tp_is_empty!11939 () Bool)

(assert (=> start!40590 tp_is_empty!11939))

(assert (=> start!40590 tp!37623))

(assert (=> start!40590 true))

(declare-datatypes ((V!17023 0))(
  ( (V!17024 (val!6014 Int)) )
))
(declare-datatypes ((ValueCell!5626 0))(
  ( (ValueCellFull!5626 (v!8269 V!17023)) (EmptyCell!5626) )
))
(declare-datatypes ((array!27687 0))(
  ( (array!27688 (arr!13289 (Array (_ BitVec 32) ValueCell!5626)) (size!13641 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27687)

(declare-fun e!262828 () Bool)

(declare-fun array_inv!9632 (array!27687) Bool)

(assert (=> start!40590 (and (array_inv!9632 _values!549) e!262828)))

(declare-fun array_inv!9633 (array!27685) Bool)

(assert (=> start!40590 (array_inv!9633 _keys!709)))

(declare-fun b!447694 () Bool)

(declare-fun e!262827 () Bool)

(declare-fun mapRes!19542 () Bool)

(assert (=> b!447694 (= e!262828 (and e!262827 mapRes!19542))))

(declare-fun condMapEmpty!19542 () Bool)

(declare-fun mapDefault!19542 () ValueCell!5626)

