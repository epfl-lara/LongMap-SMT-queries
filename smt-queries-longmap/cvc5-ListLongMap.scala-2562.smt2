; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39190 () Bool)

(assert start!39190)

(declare-fun b_free!9457 () Bool)

(declare-fun b_next!9457 () Bool)

(assert (=> start!39190 (= b_free!9457 (not b_next!9457))))

(declare-fun tp!33900 () Bool)

(declare-fun b_and!16843 () Bool)

(assert (=> start!39190 (= tp!33900 b_and!16843)))

(declare-fun b!412893 () Bool)

(declare-fun e!246991 () Bool)

(declare-fun e!246993 () Bool)

(assert (=> b!412893 (= e!246991 e!246993)))

(declare-fun res!239862 () Bool)

(assert (=> b!412893 (=> (not res!239862) (not e!246993))))

(declare-datatypes ((array!25077 0))(
  ( (array!25078 (arr!11988 (Array (_ BitVec 32) (_ BitVec 64))) (size!12340 (_ BitVec 32))) )
))
(declare-fun lt!189577 () array!25077)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25077 (_ BitVec 32)) Bool)

(assert (=> b!412893 (= res!239862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189577 mask!1025))))

(declare-fun _keys!709 () array!25077)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412893 (= lt!189577 (array!25078 (store (arr!11988 _keys!709) i!563 k!794) (size!12340 _keys!709)))))

(declare-fun bm!28546 () Bool)

(declare-datatypes ((V!15251 0))(
  ( (V!15252 (val!5349 Int)) )
))
(declare-fun minValue!515 () V!15251)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15251)

(declare-fun c!54899 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6944 0))(
  ( (tuple2!6945 (_1!3483 (_ BitVec 64)) (_2!3483 V!15251)) )
))
(declare-datatypes ((List!6970 0))(
  ( (Nil!6967) (Cons!6966 (h!7822 tuple2!6944) (t!12144 List!6970)) )
))
(declare-datatypes ((ListLongMap!5857 0))(
  ( (ListLongMap!5858 (toList!2944 List!6970)) )
))
(declare-fun call!28549 () ListLongMap!5857)

(declare-datatypes ((ValueCell!4961 0))(
  ( (ValueCellFull!4961 (v!7596 V!15251)) (EmptyCell!4961) )
))
(declare-datatypes ((array!25079 0))(
  ( (array!25080 (arr!11989 (Array (_ BitVec 32) ValueCell!4961)) (size!12341 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25079)

(declare-fun lt!189575 () array!25079)

(declare-fun getCurrentListMapNoExtraKeys!1152 (array!25077 array!25079 (_ BitVec 32) (_ BitVec 32) V!15251 V!15251 (_ BitVec 32) Int) ListLongMap!5857)

(assert (=> bm!28546 (= call!28549 (getCurrentListMapNoExtraKeys!1152 (ite c!54899 _keys!709 lt!189577) (ite c!54899 _values!549 lt!189575) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412894 () Bool)

(declare-fun res!239861 () Bool)

(assert (=> b!412894 (=> (not res!239861) (not e!246991))))

(assert (=> b!412894 (= res!239861 (and (= (size!12341 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12340 _keys!709) (size!12341 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412895 () Bool)

(declare-fun res!239852 () Bool)

(assert (=> b!412895 (=> (not res!239852) (not e!246991))))

(assert (=> b!412895 (= res!239852 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12340 _keys!709))))))

(declare-fun b!412896 () Bool)

(declare-fun e!246994 () Bool)

(assert (=> b!412896 (= e!246993 e!246994)))

(declare-fun res!239855 () Bool)

(assert (=> b!412896 (=> (not res!239855) (not e!246994))))

(assert (=> b!412896 (= res!239855 (= from!863 i!563))))

(declare-fun lt!189574 () ListLongMap!5857)

(assert (=> b!412896 (= lt!189574 (getCurrentListMapNoExtraKeys!1152 lt!189577 lt!189575 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15251)

(assert (=> b!412896 (= lt!189575 (array!25080 (store (arr!11989 _values!549) i!563 (ValueCellFull!4961 v!412)) (size!12341 _values!549)))))

(declare-fun lt!189578 () ListLongMap!5857)

(assert (=> b!412896 (= lt!189578 (getCurrentListMapNoExtraKeys!1152 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!239850 () Bool)

(assert (=> start!39190 (=> (not res!239850) (not e!246991))))

(assert (=> start!39190 (= res!239850 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12340 _keys!709))))))

(assert (=> start!39190 e!246991))

(declare-fun tp_is_empty!10609 () Bool)

(assert (=> start!39190 tp_is_empty!10609))

(assert (=> start!39190 tp!33900))

(assert (=> start!39190 true))

(declare-fun e!246989 () Bool)

(declare-fun array_inv!8742 (array!25079) Bool)

(assert (=> start!39190 (and (array_inv!8742 _values!549) e!246989)))

(declare-fun array_inv!8743 (array!25077) Bool)

(assert (=> start!39190 (array_inv!8743 _keys!709)))

(declare-fun mapNonEmpty!17535 () Bool)

(declare-fun mapRes!17535 () Bool)

(declare-fun tp!33899 () Bool)

(declare-fun e!246990 () Bool)

(assert (=> mapNonEmpty!17535 (= mapRes!17535 (and tp!33899 e!246990))))

(declare-fun mapKey!17535 () (_ BitVec 32))

(declare-fun mapRest!17535 () (Array (_ BitVec 32) ValueCell!4961))

(declare-fun mapValue!17535 () ValueCell!4961)

(assert (=> mapNonEmpty!17535 (= (arr!11989 _values!549) (store mapRest!17535 mapKey!17535 mapValue!17535))))

(declare-fun call!28550 () ListLongMap!5857)

(declare-fun bm!28547 () Bool)

(assert (=> bm!28547 (= call!28550 (getCurrentListMapNoExtraKeys!1152 (ite c!54899 lt!189577 _keys!709) (ite c!54899 lt!189575 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412897 () Bool)

(declare-fun e!246996 () Bool)

(assert (=> b!412897 (= e!246989 (and e!246996 mapRes!17535))))

(declare-fun condMapEmpty!17535 () Bool)

(declare-fun mapDefault!17535 () ValueCell!4961)

